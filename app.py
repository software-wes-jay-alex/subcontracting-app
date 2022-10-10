# imports
from cgitb import text
import os
from http import client
import flet
from flet import IconButton, Page, Row, TextField, icons, ElevatedButton, \
    LoginEvent, View, AppBar, Text, colors, Checkbox, Column, FloatingActionButton, \
        IconButton, OutlinedButton, Tab, Tabs, UserControl
from flet.auth.providers.google_oauth_provider import GoogleOAuthProvider
import json


class Task(UserControl):
    def __init__(self, task_name, task_status_change, task_delete):
        super().__init__()
        self.completed = False
        self.task_name = task_name
        self.task_status_change = task_status_change
        self.task_delete = task_delete

    def build(self):
        self.display_task = Checkbox(
            value=False, label=self.task_name, on_change=self.status_changed
        )
        self.edit_name = TextField(expand=1)

        self.display_view = Row(
            alignment="spaceBetween",
            vertical_alignment="center",
            controls=[
                self.display_task,
                Row(
                    spacing=0,
                    controls=[
                        IconButton(
                            icon=icons.CREATE_OUTLINED,
                            tooltip="Edit Item",
                            on_click=self.edit_clicked,
                        ),
                        IconButton(
                            icons.DELETE_OUTLINE,
                            tooltip="Delete Item",
                            on_click=self.delete_clicked,
                        ),
                    ],
                ),
            ],
        )

        self.edit_view = Row(
            visible=False,
            alignment="spaceBetween",
            vertical_alignment="center",
            controls=[
                self.edit_name,
                IconButton(
                    icon=icons.DONE_OUTLINE_OUTLINED,
                    icon_color=colors.GREEN,
                    tooltip="Update Item",
                    on_click=self.save_clicked,
                ),
            ],
        )
        return Column(controls=[self.display_view, self.edit_view])

    def edit_clicked(self, e):
        self.edit_name.value = self.display_task.label
        self.display_view.visible = False
        self.edit_view.visible = True
        self.update()

    def save_clicked(self, e):
        self.display_task.label = self.edit_name.value
        self.display_view.visible = True
        self.edit_view.visible = False
        self.update()

    def status_changed(self, e):
        self.completed = self.display_task.value
        self.task_status_change(self)

    def delete_clicked(self, e):
        self.task_delete(self)


class TodoApp(UserControl):
    def build(self):
        self.new_task = TextField(hint_text="What materials are needed?", expand=True)
        self.tasks = Column()

        self.filter = Tabs(
            selected_index=0,
            on_change=self.tabs_changed,
            tabs=[Tab(text="All"), Tab(text="Unverified"), Tab(text="Verified")],
        )

        self.items_left = Text("No items left")

        # application's root control (i.e. "view") containing all other controls
        return Column(
            width=600,
            controls=[
                Row([Text(value="Items", style="headlineMedium")], alignment="center"),
                Row(
                    controls=[
                        self.new_task,
                        FloatingActionButton(icon=icons.ADD, on_click=self.add_clicked),
                    ],
                ),
                Column(
                    spacing=25,
                    controls=[
                        self.filter,
                        self.tasks,
                        Row(
                            alignment="spaceBetween",
                            vertical_alignment="center",
                            controls=[
                                self.items_left,
                                OutlinedButton(
                                    text="Clear verified items", on_click=self.clear_clicked
                                ),
                            ],
                        ),
                    ],
                ),
            ],
        )

    def add_clicked(self, e):
        if self.new_task.value:
            task = Task(self.new_task.value, self.task_status_change, self.task_delete)
            self.tasks.controls.append(task)
            self.new_task.value = ""
            self.update()

    def task_status_change(self, task):
        self.update()

    def task_delete(self, task):
        self.tasks.controls.remove(task)
        self.update()

    def tabs_changed(self, e):
        self.update()

    def clear_clicked(self, e):
        for task in self.tasks.controls[:]:
            if task.completed:
                self.task_delete(task)

    def update(self):
        status = self.filter.tabs[self.filter.selected_index].text
        count = 0
        for task in self.tasks.controls:
            task.visible = (
                status == "All"
                or (status == "Unverified" and task.completed == False)
                or (status == "Verified" and task.completed)
            )
            if not task.completed:
                count += 1
        self.items_left.value = f"{count} unverified item(s) left"
        super().update()

def main(page: Page):
    # Configuration
    secret = open('client_secret.json')
    file = secret.read()
    GOOGLE_CLIENT_ID = json.loads(file)['web']['client_id']
    GOOGLE_CLIENT_SECRET = json.loads(file)['web']['client_secret']
    GOOGLE_REDIRECT_URI = 'http://127.0.0.1:8550/api/oauth/redirect'
    GOOGLE_AUTH_URI = 'https://accounts.google.com/o/oauth2/auth'
    GOOGLE_TOKEN_URI = 'https://accounts.google.com/o/oauth2/token'
    GOOGLE_USER_INFO_URI = 'https://www.googleapis.com/oauth2/v3/userinfo'

    secret.close()
    provider = GoogleOAuthProvider(
        client_id=GOOGLE_CLIENT_ID,
        client_secret=GOOGLE_CLIENT_SECRET,
        redirect_url=GOOGLE_REDIRECT_URI
    )

    

    # user navigation
    def route_change(route):
        page.views.clear()
        page.views.append(
            View(
                "/",
                [
                    AppBar(title=Text("Flet app"),
                           bgcolor=colors.SURFACE_VARIANT),
                    login_button
                ],
            )
        )
        if page.route == "/home":
            page.views.append(
                View(
                    "/home",
                    [
                        AppBar(title=Text("Flet app"),
                               bgcolor=colors.SURFACE_VARIANT),
                        logout_button,
                        Text("Welcome to the home page"),
                        list_button
                    ],
                )
            )
        if page.route == "/list":
            app = TodoApp()
            page.views.append(
                View(
                    "/list",
                    [
                        AppBar(title=Text("My list"),
                               bgcolor=colors.SURFACE_VARIANT),
                        logout_button, app
                    ], horizontal_alignment="center",
                    scroll="adaptive"
                )
                
            )
        print("View Updated, Current Route: ", page.route)
        page.update()

    def view_pop(view):
        page.views.pop()
        top_view = page.views[-1]
        page.go(top_view.route)

    page.on_route_change = route_change
    page.on_view_pop = view_pop

    # google sign in
    def login_button_click(e):
        
        page.login(provider, fetch_user=True)
        page.go("/home")
        print("login button clicked, redirecting to ", page.route)

    def on_login(e: LoginEvent):
        if not e.error:
            print("Access token:", page.auth.token.access_token)
            print("User ID:", page.auth.user.id)
            # use token to access google api
            conn = client.HTTPSConnection('www.googleapis.com')
            conn.request('GET',
                         '/oauth2/v3/userinfo?access_token=' + page.auth.token.access_token)
            res = conn.getresponse()
            data = res.read()
            print(data.decode("utf-8"))
            conn.close()
        else:
            print("Error:", e.error)
            print("Error description:", e.error_description)

    def logout_button_click(e):
        page.logout()
        page.go("/")
        print("logout button clicked, redirecting to ", page.route)

    def on_logout(e: LoginEvent):
        if not e.error:
            print("Logout successful")
        else:
            print("Error:", e.error)
            print("Error description:", e.error_description)

    def on_list_button_click(e):
        page.go("/list")

    login_button = ElevatedButton("Login with Google",
                                  on_click=login_button_click)
    logout_button = ElevatedButton("Logout", on_click=logout_button_click)
    list_button = ElevatedButton("My list", on_click=on_list_button_click)
    page.on_login = on_login
    page.on_logout = on_logout
    #start app on sign in page
    page.go("/")

    

# run in native OS window
flet.app(target=main, port=8550, route_url_strategy="path")
# run as web app
#flet.app(target=main, port=8550, view=flet.WEB_BROWSER,
         #route_url_strategy="path")