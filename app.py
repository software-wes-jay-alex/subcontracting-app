import flet
from flet import IconButton, Page, Row, TextField, icons


def main(page: Page):
    page.title = "Subcontractor App"
    page.vertical_alignment = "center"

    # google sign in
    def on_google_sign_in():
        print("Google sign in")
    google_sign_in = IconButton(icon=icons.LOGIN, on_click=on_google_sign_in())
    page.add(Row([
        google_sign_in
    ], alignment="center"))


# run in native OS window
flet.app(target=main)
# run as web app
#flet.app(target=main, view=flet.WEB_BROWSER)
