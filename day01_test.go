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

func TestFirstTimeInBasement01(t *testing.T) {
	instruction := ")"
	attempt := firstTimeInBasement(instruction)
	if attempt != 1 {
		t.Fatalf("Should be 1st attempt, but it is %v", attempt)
	}
}

func TestFirstTimeInBasement02(t *testing.T) {
	instruction := "())"
	attempt := firstTimeInBasement(instruction)
	if attempt != 3 {
		t.Fatalf("Should be 3rd attempt,but it is %v", attempt)
	}
}

func TestFirstTimeInBasement03(t *testing.T) {
	instruction := "(()))"
	attempt := firstTimeInBasement(instruction)
	if attempt != 5 {
		t.Fatalf("Should be 5th attempt, but it is %v", attempt)
	}
}
