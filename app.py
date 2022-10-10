# imports
from cgitb import text
import os
from http import client
import flet
from flet import IconButton, Page, Row, TextField, icons, ElevatedButton, \
    LoginEvent, View, AppBar, Text, colors
from flet.auth.providers.google_oauth_provider import GoogleOAuthProvider
import json


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
            page.views.append(
                View(
                    "/list",
                    [
                        AppBar(title=Text("My list"),
                               bgcolor=colors.SURFACE_VARIANT),
                        logout_button,
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