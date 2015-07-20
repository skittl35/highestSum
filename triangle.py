#fullList contains all values, tempList will be used to insert each row in fullList
tempList = []
fullList = []

#open file with number pyramid
pyramidFile = open('triangle.txt', 'r')

#loop through file line by line
for line in pyramidFile:
    #pass each line into the fullList variable
    fullList.append(line.split())

pyramidFile.close()


#First row to process is second to last, so len-1 (2 for some reason?)
startRow = len(fullList)-2

#Need to loop through both dimensions - startRow for D1, checkIndex for D2
while startRow >= 0:
    checkIndex = 0
    thisRow = fullList[startRow] #To determine end of while loop below

    #Loop through current row (D2)
    while checkIndex <= len(thisRow)-1:
        #Find values of each number below current value being examined
        var1 = fullList[startRow+1][checkIndex]
        var2 = fullList[startRow+1][checkIndex+1]

        #Add highest value to current examined number, then set that value
        #in place of the number being examined
        if(var1 > var2):
            fullList[startRow][checkIndex] = int(fullList[startRow][checkIndex]) + int(var1)
        else:
            fullList[startRow][checkIndex] = int(fullList[startRow][checkIndex]) + int(var2)

        #Increment for D2 Loop
        checkIndex += 1

    #Increment for D1 Loop
    startRow -= 1

#With both loops now finished, final answer should appear at the top of the pyramid
print(fullList[0][0])
