package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

var userCmd = &cobra.Command{
	Use:   "user",
	Short: "Manage users",
}

var userAddCmd = &cobra.Command{
	Use:   "add",
	Short: "Add user",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("user add called")
	},
}

var userListCmd = &cobra.Command{
	Use:   "list",
	Short: "List users",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("user list called")
	},
}

func init() {
	userCmd.AddCommand(userAddCmd)
	userCmd.AddCommand(userListCmd)

	rootCmd.AddCommand(userCmd)
}
