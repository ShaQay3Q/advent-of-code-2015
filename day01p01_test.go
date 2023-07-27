package main

import (
	"testing"
)

func TestWhichFoor01(t *testing.T) {
	instruction := ""
	floorNumber := whichFloor(instruction)
	if floorNumber != 0 {
		t.Fatalf("Should be 0")
	}
}

func TestWhichFoor02(t *testing.T) {
	instruction := "("
	floorNumber := whichFloor(instruction)
	if floorNumber != 1 {
		t.Fatalf("Should be 1")
	}
}

func TestWhichFoor03(t *testing.T) {
	instruction := ")"
	floorNumber := whichFloor(instruction)
	if floorNumber != -1 {
		t.Fatalf("Should be -1")
	}
}

func TestWhichFoor04(t *testing.T) {
	instruction := "((()"
	floorNumber := whichFloor(instruction)
	if floorNumber != 2 {
		t.Fatalf("Should be 2")
	}
}
