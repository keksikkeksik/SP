
#!/bin/bash
echo "----------------------------------------------------------------------------------------"
echo "script Trofimova Irina "
echo "group 726"
echo "The script asks for the path to the first file"
echo "The script asks for the path to the second file"
echo "The script sets access rights to the second file accordig to the model of the first file"
echo "----------------------------------------------------------------------------------------"

while :
do

        echo "Enter the path of the first file:"
        read firstPath
        while :
        do
                if [ ! -f $firstPath ]
                then
                        echo "!!!! File does not exist"
                        echo "Enter file path:"
                        read firstPath
                else
                        break
                fi
        done

        echo "Enter the path of the second file:"
        read secondPath
		        while :
        do
                        if [ ! -f $secondPath ]
                then
                        echo "!!!! File does not exist"
                        echo "Enter file path:"
                        read secondPath
                else
                        break
                fi
        done

        echo "Access rights for first file:"
        pravaFirstFile=`stat --format=%A $firstPath`
        echo $pravaFirstFile

        echo "Access rights for second file:"
        pravaSecondFile=`stat --format=%A $secondPath`
        echo $pravaSecondFile
		
		while :
        do

			echo "Set permission for the second file based on the model of the first file? (y/n)"
			read answer

            if [[ $answer == "y" || $answer == "Y" || $answer == "N" || $answer == "n" ]]
                    then
                           if [[ $answer == "Y" || $answer == "y" ]]
                                        then
                                                prava=`stat --format=%a $firstPath`
                                                chmod $prava $secondPath
                                                echo "access rigts for secondfile:"
                                                pravaSecondFile2=`stat --format=%A $secondPath`
                                                echo $pravaSecondFile2
                                                break
                                        else
                                                break
                                fi
                        else
                                echo "Input error"
                fi
        done
		
		while :
        do
                echo "repeat? (y/n)"
                read answer
                if [[ $answer == "y" || $answer == "Y" || $answer == "n" || $answer == "N" ]]
                        then
                                if [[ $answer == "n" || $answer == "N" ]]
                                        then
                                                exit 0
                                        else
                                                break
                                fi
                        else
                                echo "Input error"
                fi
        done
done