package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func testCloudFrontResponseHeadersPolicy(t *testing.T, variant string) {
	t.Parallel()

	terraformDir := fmt.Sprintf("../examples/%s", variant)

	terraformOptions := &terraform.Options{
		TerraformDir: terraformDir,
		LockTimeout:  "5m",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	id := terraform.Output(t, terraformOptions, "id")
	name := terraform.Output(t, terraformOptions, "name")

	expectedName := fmt.Sprintf("cloudfront-response-headers-policy-module-%s", variant)

	assert.NotNil(t, id)
	assert.Equal(t, expectedName, name)
}
