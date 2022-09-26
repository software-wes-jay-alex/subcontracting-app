import flet
from flet import IconButton, Page, Row, TextField, icons

def main(page: Page):
    page.title = "Flet counter example"
    page.vertical_alignment = "center"

    txt_number = TextField(value="0", text_align="right", width=100)

    #google sign in
    def on_google_sign_in():
        print("Google sign in")
    google_sign_in = IconButton(icon=icons.google, on_click=on_google_sign_in)
    page.add(google_sign_in)
#run in native OS window
flet.app(target=main)
#run as web app
#flet.app(target=main, view=flet.WEB_BROWSER)
