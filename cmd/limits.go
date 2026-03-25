package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

var limitsCmd = &cobra.Command{
	Use:   "limits",
	Short: "Manage limits",
}

var limitsCheckCmd = &cobra.Command{
	Use:   "check",
	Short: "Check limits",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("limits check called")
	},
}

func init() {
	limitsCmd.AddCommand(limitsCheckCmd)
	rootCmd.AddCommand(limitsCmd)
}
