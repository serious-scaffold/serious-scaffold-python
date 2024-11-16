"""Test for cli."""

from click.testing import CliRunner

from ss_python.cli import app


def test_cli() -> None:
    """Test for cli."""
    runner = CliRunner()
    result = runner.invoke(app)
    assert result.exit_code == 0
    assert "Usage" in result.output


def test_cli_run() -> None:
    """Test for run subcommand of the cli."""
    runner = CliRunner()
    result = runner.invoke(app, "run")
    assert result.exit_code == 0
    assert not result.output
