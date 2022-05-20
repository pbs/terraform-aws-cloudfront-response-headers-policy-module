package test

import (
	"testing"
)

func TestPopulatedExample(t *testing.T) {
	testCloudFrontResponseHeadersPolicy(t, "populated")
}
