"""Command Line Interface."""
import typer

app = typer.Typer()


@app.command()
def run() -> None:
    """Run command."""


# NOTE(huxuan): callback is required for single command as subcommand.
# And it is a convenient way to document the whole cli app.
# Reference: https://typer.tiangolo.com/tutorial/commands/one-or-multiple/


@app.callback()
def callback() -> None:
    """CLI for Serious Scaffold Python."""


# NOTE(huxuan): click object is used for document generation.
# Reference: https://github.com/tiangolo/typer/issues/200#issuecomment-796485787
typer_click_object = typer.main.get_command(app)


if __name__ == "__main__":
    app()  # pragma: no cover
