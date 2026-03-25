package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

var protocolCmd = &cobra.Command{
	Use:   "protocol",
	Short: "Manage protocols",
}

var protocolListCmd = &cobra.Command{
	Use:   "list",
	Short: "List protocols",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("protocol list called")
	},
}

func init() {
	protocolCmd.AddCommand(protocolListCmd)
	rootCmd.AddCommand(protocolCmd)
}
