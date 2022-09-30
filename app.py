#imports
from cgitb import text
import os
from http import client
import flet
from flet import IconButton, Page, Row, TextField, icons, ElevatedButton, LoginEvent
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

    page.title = "App"
    page.vertical_alignment = "center"

    # google sign in
    def login_button_click(e):
        page.login(provider, fetch_user=True)

    def on_login(e: LoginEvent):
        if not e.error:
            toggle_login_buttons()
            print("Access token:", page.auth.token.access_token)
            print("User ID:", page.auth.user.id)
            #use token to access google api
            conn = client.HTTPSConnection('www.googleapis.com')
            conn.request('GET', '/oauth2/v3/userinfo?access_token=' + page.auth.token.access_token)
            res = conn.getresponse()
            data = res.read()
            print(data.decode("utf-8"))
            conn.close()


    def logout_button_click(e):
        page.logout()

    def on_logout(e):
        toggle_login_buttons()

    def toggle_login_buttons():
        login_button.visible = page.auth is None
        logout_button.visible = page.auth is not None
        page.update()

    login_button = ElevatedButton("Login with Google", on_click=login_button_click)
    logout_button = ElevatedButton("Logout", on_click=logout_button_click)
    toggle_login_buttons()
    page.on_login = on_login
    page.on_logout = on_logout
    page.add(Row([login_button, logout_button], alignment="center"))

#run in native OS window
flet.app(target=main, port=8550)
#run as web app
#flet.app(target=main, port=8550, view=flet.WEB_BROWSER)
