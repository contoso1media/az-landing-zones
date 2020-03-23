$Url = "https://prod-43.westeurope.logic.azure.com:443/workflows/293f849dbf274eaeb70d4016d770fea5/triggers/manual/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=rh3nm8cXuBnMcpamtsJPs3wvF2j8YMU2PHKK_GPXH-0"
              
              $Body = @{
                  resource_group = $(sqldbsgname)
                  status = "data upload started"
                  type = "SQL Database"
                  build_number =  $env:BUILD_BUILDNUMBER
                  service_uri = "onemediasqlserver.database.windows.net"
              }
              
              $json = $Body | ConvertTo-Json
              
              Invoke-RestMethod -Method 'Post' -Uri $url -Body $json -ContentType 'application/json'
              ##azurePowerShellVersion: LatestVersion
