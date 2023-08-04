package main

func whichFloor(instruction string) (floorNumber int) {
	floorNumber = 0
	for index := 0; index < len(instruction); index++ {
		indexCharachter := instruction[index]
		if indexCharachter == '(' {
			floorNumber = floorNumber + 1
		} else {
			floorNumber = floorNumber - 1
		}
	}
	return
}

func firstTimeInBasement(instruction string) (indexNumber int) {
	floor := 0
	index := 0
	for ; index < len(instruction); index++ {
		indexCharacter := instruction[index]
		if indexCharacter == ')' {
			floor--
		} else {
			floor++
		}
		if floor == -1 {
			index++
			break
		}
	}
	return index
}
