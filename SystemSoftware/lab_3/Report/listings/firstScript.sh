#!/bin/bash

# First method
echo "Zenkin A.M., Karpov K.V., Pachkovsky K.A. Variant:1"

#Second method
nameVar="Zenkin A.M., Karpov K.V., Pachkovsky K.A. Variant:1"
echo $nameVar

#Fird method
printData() {
	local data="Zenkin A.M., Karpov K.V., Pachkovsky K.A. Variant:1"
	echo $data
}

printData