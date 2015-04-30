<!--- ##############################################################################
####################################################################################
The process:

1. Loop through the provided text file, putting each line into a 2d array (valueArray)
2. Starting on the second to last line, loop through each value in the second dimension in the array
	a. compare both numbers under it (if on index i, compare values in next row at index i and i+1)
	b. once it is determined which value is highest, add it to the number being evaluated in step 2
3. Repeat step 2 all the way up the pyramid, doing so will inevitably set the number at index [1][1]
(the top of the pyramid) to the highest possible sum.

####################################################################################
################################################################################--->


<cfset lineIndex = 1>
<cfset valueArray = ArrayNew(2)>

<cfloop file="E:\WEB\triangleMaxSum\triangle.txt" index="line">
    <cfset totalValues="#listLen(line, ' ')#">
    <cfloop from="1" to="#totalValues#" index="v">
    	<cfset valueArray[lineIndex][v] = #listGetAt(line, v, ' ')#>
    </cfloop>

    <cfset lineIndex += 1>
</cfloop>

<!--- Loop through triangle rows bottom to top --->
<cfset fromVar = #arrayLen(valueArray)#-1>
<cfloop from="#fromVar#" to="1" index="r" step="-1">
	<!--- Loop through row values left to right --->
	<cfloop from="1" to="#arrayLen(valueArray[r])#" index="v">
		<cfset leftOption = valueArray[r+1][v]>
		<cfset rightOption = valueArray[r+1][v+1]>

		<cfif leftOption GT rightOption>
			<cfset valueArray[r][v] = valueArray[r][v] + valueArray[r+1][v]>	
		<cfelse>
			<cfset valueArray[r][v] = valueArray[r][v] + valueArray[r+1][v+1]>
		</cfif>
	</cfloop>
</cfloop>

<cfoutput>#valueArray[1][1]#</cfoutput>