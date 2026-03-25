package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

var systemCmd = &cobra.Command{
	Use:   "system",
	Short: "System operations",
}

var systemStatusCmd = &cobra.Command{
	Use:   "status",
	Short: "Show system status",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("system status called")
	},
}

func init() {
	systemCmd.AddCommand(systemStatusCmd)
	rootCmd.AddCommand(systemCmd)
}
