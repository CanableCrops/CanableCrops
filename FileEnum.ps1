clear-host
"Note: A recursive enumeration will enumerate access control information for all nested files and directories."
"Warning: This will query a large amount of information`n`n"
"Press Y to perform a recursive query or N to perform a normal query."

$recurse = Read-Host "Y/N"

if ($recurse -eq 'y' -or $recurse -eq 'Y')
    {
    do
        {
            Clear-Host

            $rootLocation = Read-Host "What directory or file path would you like to query?"

            $allItems = Get-ChildItem -Path $rootLocation -Force -Recurse | select -ExpandProperty FullName | Sort-Object

                foreach ($Item in $allItems)
                    {
                           $ACL = (Get-Acl -Path $Item).AccessToString -split "`n"
                           "`n"
                           $Item

                                foreach ($A in $ACL)
                                {
                                    "`t" + $A
                                }

                    }
                        "`n`n`n`n"
                        $question = Read-Host "Would you like to run again? Y/N"
                        "`n`n"
        }
    while ($question -eq 'y' -or $question -eq 'Y')
    }
else
    {
    do
    {
        Clear-Host

        $rootLocation = Read-Host "What directory or file path would you like to query?"

        $allItems = Get-ChildItem -Path $rootLocation -Force | select -ExpandProperty FullName | Sort-Object

            foreach ($Item in $allItems)
            {
                $ACL = (Get-Acl -Path $Item).AccessToString -split "`n"
                "`n"
                $Item

                    foreach ($A in $ACL)
                        {
                            "`t" + $A
                        }

            }
                "`n`n`n`n"
                $question = Read-Host "Would you like to run again? Y/N"
                "`n`n"
    }
while ($question -eq 'y' -or $question -eq 'Y')
}