#SingleInstance
DetectHiddenWindows, On
VerticalScale := 1
numberOfRows := 26
numberOfCols := 26
GridHeight := VerticalScale * A_ScreenHeight
GridWidth := A_ScreenWidth
rowSpacing := GridHeight / numberOfRows	
colSpacing := 1.025 * GridWidth / numberOfCols
AscA := 97
KeyArray := ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

#IfWinNotActive CoordGrid
	#IfWinNotExist CoordGrid
		global VerticalScale, numberOfRows, numberOfCols, GridHeight, GridWidth, rowSpacing, colSpacing, KeyArray

		NumpadEnter::
	 		; Display Coordinates 
			rowCounter := 0
			Loop {
				rowYCoord := (numberOfRows - 1 - rowCounter) * rowSpacing ;
				rowYCoordAlpha := KeyArray[rowCounter+1]
				StringUpper, rowYCoordAlpha, rowYCoordAlpha
				colCounter := 0
				Loop {
					colXCoord := colCounter * colSpacing
					colXCoordAlpha := KeyArray[colCounter+1]
					StringUpper, colXCoordAlpha, colXCoordAlpha
					; gui, add, edit, x%colXCoord% y%rowYCoord% ReadOnly cRed, %colXCoordAlpha%%rowYCoordAlpha%
					gui, add, edit, x%colXCoord% y%rowYCoord%, %colXCoordAlpha%%rowYCoordAlpha%
					colCounter := colCounter + 1
				}    
				Until colCounter = numberOfcols			
				rowCounter := rowCounter + 1
			}    
			Until rowCounter = numberOfRows		

			Gui, Color, 000115
			Gui, Show, W%GridWidth% H%GridHeight%, CoordGrid
			Gui -Caption +AlwaysOnTop
			Gui, maximize
			WinSet, Transcolor, 000115, CoordGrid
			
			Return
	#IfWinNotExist	
#IfWinNotActive	

#IfWinExist CoordGrid
	#IfWinNotActive CoordGrid
		NumpadEnter::
			Gui Show
			Return
	#IfWinNotActive	
#IfWinExist

#IfWinActive CoordGrid
	NumpadEnter::
		Gui Hide
		Return

	~a:: gosub, RunKey
	~b:: gosub, RunKey
	~c:: gosub, RunKey
	~d:: gosub, RunKey
	~e:: gosub, RunKey
	~f:: gosub, RunKey
	~g:: gosub, RunKey
	~h:: gosub, RunKey
	~i:: gosub, RunKey
	~j:: gosub, RunKey
	~k:: gosub, RunKey
	~l:: gosub, RunKey
	~m:: gosub, RunKey
	~n:: gosub, RunKey
	~o:: gosub, RunKey
	~p:: gosub, RunKey
	~q:: gosub, RunKey
	~r:: gosub, RunKey
	~s:: gosub, RunKey
	~t:: gosub, RunKey
	~u:: gosub, RunKey
	~v:: gosub, RunKey
	~w:: gosub, RunKey
	~x:: gosub, RunKey
	~y:: gosub, RunKey
	~z:: gosub, RunKey

	Runkey:
		if winc_presses > 0  
		{
		    winc_presses += 1
		    Return
		} 
		winc_presses = 1
		SetTimer, TheKey, 1000
		Return

	TheKey:
		SetTimer, TheKey, off
		if winc_presses = 2  
		{
			NavigateToCoord()
		}

		winc_presses = 0
		Return	

	NavigateToCoord()
	{
		CoordMode, Mouse, Window
		global VerticalScale, numberOfRows, numberOfCols, GridHeight, GridWidth, rowSpacing, colSpacing

		XCoordInput := SubStr(A_PriorHotkey,2,1)
		YCoordInput := SubStr(A_ThisHotkey,2,1)
		XCoordToUse := ConvertInputCoord(XcoordInput, "X")
		YCoordToUse := ConvertInputCoord(YcoordInput, "Y")

		XCoord := (XCoordToUse+0.2) * colSpacing
		YCoord := (YCoordToUse-0.7) * rowSpacing

		MouseMove, %XCoord%, %YCoord%
		sleep, 100
		Gui Hide
		Click
		Return
	}

	ConvertInputCoord(coordInput, XorY)
	{
		global AscA
		coordAsc := Asc(coordInput)
		if (XorY = "X") {
			coordToUse := coordAsc - AscA
		}
		else {
			coordToUse := numberOfRows - (coordAsc - AscA)
		}
		coordToUse := floor(coordToUse) 
		Return coordToUse
	}
#IfWinActive