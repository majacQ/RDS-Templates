<#Author       : Akash Chawla
# Usage        : Set default Language 
#>

#######################################
#    Set default Language             #
#######################################


[CmdletBinding()]
  Param (
        [Parameter(Mandatory)]
        [ValidateSet("Arabic (Saudi Arabia)","Bulgarian (Bulgaria)","Chinese (Simplified, China)","Chinese (Traditional, Taiwan)","Croatian (Croatia)","Czech (Czech Republic)","Danish (Denmark)","Dutch (Netherlands)", "English (United Kingdom)", "Estonian (Estonia)", "Finnish (Finland)", "French (Canada)", "French (France)", "German (Germany)", "Greek (Greece)", "Hebrew (Israel)", "Hungarian (Hungary)", "Italian (Italy)", "Japanese (Japan)", "Korean (Korea)", "Latvian (Latvia)", "Lithuanian (Lithuania)", "Norwegian, Bokmål (Norway)", "Polish (Poland)", "Portuguese (Brazil)", "Portuguese (Portugal)", "Romanian (Romania)", "Russian (Russia)", "Serbian (Latin, Serbia)", "Slovak (Slovakia)", "Slovenian (Slovenia)", "Spanish (Mexico)", "Spanish (Spain)", "Swedish (Sweden)", "Thai (Thailand)", "Turkish (Turkey)", "Ukrainian (Ukraine)")]
        [string]$Language
)

function Set-DefaultLanguage($Language) {

  BEGIN {

      $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
      Write-Host "*** Starting AVD AIB CUSTOMIZER PHASE: Set default Language ***"

      $templateFilePathFolder = "C:\AVDImage"
      # Reference: https://learn.microsoft.com/en-gb/powershell/module/languagepackmanagement/set-systempreferreduilanguage?view=windowsserver2022-ps
      # populate dictionary
      $LanguagesDictionary = @{}
      $LanguagesDictionary.Add("Arabic (Saudi Arabia)", "ar-SA")
      $LanguagesDictionary.Add("Bulgarian (Bulgaria)", "bg-BG")
      $LanguagesDictionary.Add("Chinese (Simplified, China)", "zh-CN")
      $LanguagesDictionary.Add("Chinese (Traditional, Taiwan)", "zh-TW")
      $LanguagesDictionary.Add("Croatian (Croatia)",	"hr-HR")
      $LanguagesDictionary.Add("Czech (Czech Republic)",	"cs-CZ")
      $LanguagesDictionary.Add("Danish (Denmark)",	"da-DK")
      $LanguagesDictionary.Add("Dutch (Netherlands)",	"nl-NL")
      $LanguagesDictionary.Add("English (United States)",	"en-US")
      $LanguagesDictionary.Add("English (United Kingdom)",	"en-GB")
      $LanguagesDictionary.Add("Estonian (Estonia)",	"et-EE")
      $LanguagesDictionary.Add("Finnish (Finland)",	"fi-FI")
      $LanguagesDictionary.Add("French (Canada)",	"fr-CA")
      $LanguagesDictionary.Add("French (France)",	"fr-FR")
      $LanguagesDictionary.Add("German (Germany)",	"de-DE")
      $LanguagesDictionary.Add("Greek (Greece)",	"el-GR")
      $LanguagesDictionary.Add("Hebrew (Israel)",	"he-IL")
      $LanguagesDictionary.Add("Hungarian (Hungary)",	"hu-HU")
      $LanguagesDictionary.Add("Indonesian (Indonesia)",	"id-ID")
      $LanguagesDictionary.Add("Italian (Italy)",	"it-IT")
      $LanguagesDictionary.Add("Japanese (Japan)",	"ja-JP")
      $LanguagesDictionary.Add("Korean (Korea)",	"ko-KR")
      $LanguagesDictionary.Add("Latvian (Latvia)",	"lv-LV")
      $LanguagesDictionary.Add("Lithuanian (Lithuania)",	"lt-LT")
      $LanguagesDictionary.Add("Norwegian, Bokmål (Norway)",	"nb-NO")
      $LanguagesDictionary.Add("Polish (Poland)",	"pl-PL")
      $LanguagesDictionary.Add("Portuguese (Brazil)",	"pt-BR")
      $LanguagesDictionary.Add("Portuguese (Portugal)",	"pt-PT")
      $LanguagesDictionary.Add("Romanian (Romania)",	"ro-RO")
      $LanguagesDictionary.Add("Russian (Russia)",	"ru-RU")
      $LanguagesDictionary.Add("Serbian (Latin, Serbia)",	"sr-Latn-RS")
      $LanguagesDictionary.Add("Slovak (Slovakia)",	"sk-SK")
      $LanguagesDictionary.Add("Slovenian (Slovenia)",	"sl-SI")
      $LanguagesDictionary.Add("Spanish (Mexico)",	"es-MX")
      $LanguagesDictionary.Add("Spanish (Spain)",	"es-ES")
      $LanguagesDictionary.Add("Swedish (Sweden)",	"sv-SE")
      $LanguagesDictionary.Add("Thai (Thailand)",	"th-TH")
      $LanguagesDictionary.Add("Turkish (Turkey)",	"tr-TR")
      $LanguagesDictionary.Add("Ukrainian (Ukraine)",	"uk-UA")

      $LanguageTag = $LanguagesDictionary.$Language 
  }

  PROCESS {
      Set-SystemPreferredUILanguage -Language $LanguageTag
      Write-Host "*** AVD AIB CUSTOMIZER PHASE: Set default Language - $Language has been set as the default System Preferred UI Language***"
  }

  END {

      if ((Test-Path -Path $templateFilePathFolder -ErrorAction SilentlyContinue)) {
          Remove-Item -Path $templateFilePathFolder -Force -Recurse -ErrorAction Continue
      }

      $stopwatch.Stop()
      $elapsedTime = $stopwatch.Elapsed
      Write-Host "*** AVD AIB CUSTOMIZER PHASE: Set default Language - Exit Code: $LASTEXITCODE ***"
      Write-Host "*** AVD AIB CUSTOMIZER PHASE: Set default Language - Time taken: $elapsedTime ***"
  }
}

Set-DefaultLanguage -Language $Language

#############
#    END    #
#############
