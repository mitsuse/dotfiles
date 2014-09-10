package main

import (
	"os"

	"github.com/codegangsta/cli"
)

func main() {
	app := initApp()
	app.Run(os.Args)
}

func initApp() *cli.App {
	app := cli.NewApp()

	app.Name = ""
	app.Version = ""
	app.Usage = ""

	app.Commands = []cli.Command{
		newSubCommand(),
	}

	return app
}

func newSubCommand() cli.Command {
	command := cli.Command{
		Name:      "subcmd",
		ShortName: "s",
		Usage:     "help message",
		Action:    func(context *cli.Context) {},

		Flags: []cli.Flag{},
	}
	return command
}
