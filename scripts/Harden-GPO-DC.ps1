function Set-RegistryValue {
    param(
        [string]$Path,
        [string]$Name,
        $Value,
        [string]$Type = 'DWord'
    )

    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }

    Set-ItemProperty -Path $Path -Name $Name -Value $Value -Type $Type
    Write-Host "[+] Applied: $Path -> $Name = $Value"
}

Write-Host "Starting hardening configuration..."

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" -Name "LDAPServerIntegrity" -Value 2 -Type DWord

Set-RegistryValue -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" -Name "LdapEnforceChannelBinding" -Value 2 -Type DWord

Set-RegistryValue -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters" -Name "AllowEncryptionOracle" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\CredentialsDelegation" -Name "AllowProtectedCreds" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "RequirePlatformSecurityFeatures" -Value 3 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "HypervisorEnforcedCodeIntegrity" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "HVCIMATRequired" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "ConfigureSystemGuardLaunch" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Name "PreventDeviceMetadataFromNetwork" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\System\CurrentControlSet\Policies\EarlyLaunch" -Name "DriverLoadPolicy" -Value 3 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" -Name "NoGPOListChanges" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" -Name "NoBackgroundPolicy" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableCdp" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableBkGndGroupPolicy" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Printers" -Name "DisableWebPnPDownload" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" -Name "PreventHandwritingDataSharing" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" -Name "PreventHandwritingErrorReports" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard" -Name "ExitOnMSICW" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoWebServices" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" -Name "DisableHTTPPrinting" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Registration Wizard Control" -Name "NoRegistration" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\SearchCompanion" -Name "DisableContentFileUpdates" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoOnlinePrintsWizard" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoPublishingWizard" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Messenger\Client" -Name "CEIP" -Value 2 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\SQMClient\Windows" -Name "CEIPEnable" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\PCHealth\ErrorReporting" -Name "DoReport" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters" -Name "DevicePKInitBehavior" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters" -Name "DevicePKInitEnabled" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection" -Name "DeviceEnumerationPolicy" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Control Panel\International" -Name "BlockUserInputMethodsForSignIn" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "BlockUserFromShowingAccountDetailsOnSignin" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "DontDisplayNetworkSelectionUI" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "DontEnumerateConnectedUsers" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "DisableLockScreenAppNotifications" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "BlockDomainPicturePassword" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "AllowDomainPINLogon" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "AllowCrossDeviceClipboard" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Name "DCSettingIndex" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Name "ACSettingIndex" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\policies\Microsoft\Windows NT\Terminal Services" -Name "fAllowUnsolicited" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\policies\Microsoft\Windows NT\Terminal Services" -Name "fAllowToGetHelp" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" -Name "DisableQueryRemoteServer" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" -Name "ScenarioExecutionEnabled" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\W32time\TimeProviders\NtpClient" -Name "Enabled" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager" -Name "AllowSharedLocalAppData" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "MSAOptional" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" -Name "NoAutoplayfornonVolume" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoAutorun" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoDriveTypeAutoRun" -Value 255 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures" -Name "EnhancedAntiSpoofing" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Camera" -Name "AllowCamera" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableConsumerAccountStateContent" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Connect" -Name "RequirePinForPairing" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\CredUI" -Name "DisablePasswordReveal" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" -Name "EnumerateAdministrators" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "DisableEnterpriseAuthProxy" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "DisableOneSettingsDownloads" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "DoNotShowFeedbackNotifications" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "EnableOneSettingsAuditing" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "LimitDiagnosticLogCollection" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "LimitDumpCollection" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" -Name "AllowBuildPreview" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application" -Name "Retention" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application" -Name "MaxSize" -Value 32768 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Security" -Name "Retention" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Security" -Name "MaxSize" -Value 196608 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Setup" -Name "Retention" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Setup" -Name "MaxSize" -Value 32768 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\System" -Name "Retention" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\System" -Name "MaxSize" -Value 32768 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "NoDataExecutionPrevention" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "NoHeapTerminationOnCorruption" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "PreXPSP2ShellProtocolBehavior" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableLocation" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messaging" -Name "AllowMessageSync" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount" -Name "DisableUserAuth" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\PushToInstall" -Name "DisablePushToInstall" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "DisablePasswordSaving" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fSingleSessionPerUser" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "EnableUiaRedirection" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisableCcm" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisableCdm" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisableLocationRedir" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisableLPT" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisablePNPRedir" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fPromptForPassword" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fEncryptRPCTraffic" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "SecurityLayer" -Value 2 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "UserAuthentication" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "MinEncryptionLevel" -Value 3 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "MaxIdleTime" -Value 900000 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "MaxDisconnectionTime" -Value 60000 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "DeleteTempDirsOnExit" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "PerSessionTempDir" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Feeds" -Name "DisableEnclosureDownload" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCloudSearch" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowIndexingEncryptedStoresOrItems" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" -Name "NoGenTicket" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableSmartScreen" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "ShellSmartScreenLevel" -Value "Block" -Type "String"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\WindowsInkWorkspace" -Name "AllowSuggestedAppsInWindowsInkWorkspace" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\WindowsInkWorkspace" -Name "AllowWindowsInkWorkspace" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Name "EnableUserControl" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Name "AlwaysInstallElevated" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Name "SafeForScripting" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableAutomaticRestartSignOn" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -Name "AllowBasic" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -Name "AllowUnencryptedTraffic" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -Name "AllowDigest" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Name "AllowBasic" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Name "AllowAutoConfig" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Name "AllowUnencryptedTraffic" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Name "DisableRunAs" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service\WinRS" -Name "AllowRemoteShellAccess" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" -Name "DisallowExploitProtectionOverride" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoRebootWithLoggedOnUsers" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "ScheduledInstallDay" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "ManagePreviewBuilds" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "ManagePreviewBuildsPolicyValue" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferFeatureUpdates" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "BranchReadinessLevel" -Value 2 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferFeatureUpdatesPeriodInDays" -Value 180 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferQualityUpdates" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferQualityUpdatesPeriodInDays" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableUPnPRegistrar" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableInBand802DOT11Registrar" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableFlashConfigRegistrar" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableWPDRegistrar" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\UI" -Name "DisableWcnUi" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" -Name "fMinimizeConnections" -Value 3 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" -Name "fBlockNonDomain" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters" -Name "DisableIPSourceRouting" -Value 2 -Type "DWord"

Set-RegistryValue -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" -Name "DisableIPSourceRouting" -Value 2 -Type "DWord"

Set-RegistryValue -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" -Name "EnableICMPRedirect" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "KeepAliveTime" -Value 300000 -Type "DWord"

Set-RegistryValue -Path "HKLM:\System\CurrentControlSet\Services\Netbt\Parameters" -Name "NoNameReleaseOnDemand" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "PerformRouterDiscovery" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" -Name "SafeDLLSearchMode" -Value 1 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "ScreenSaverGracePeriod" -Value 5 -Type "DWord"

Set-RegistryValue -Path "HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters" -Name "TcpMaxDataRetransmissions" -Value 3 -Type "DWord"

Set-RegistryValue -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpMaxDataRetransmissions" -Value 3 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Eventlog\Security" -Name "WarningLevel" -Value 90 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" -Name "NoWarningNoElevationOnInstall" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" -Name "UpdatePromptSettings" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "LsaCfgFlags" -Value 0 -Type "DWord"

Set-RegistryValue -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\SAM" -Name "SamNGCKeyROCAValidation" -Value 1 -Type "DWord"

Stop-Service -Name Spooler -Force -ErrorAction SilentlyContinue

Set-Service -Name Spooler -StartupType Disabled

Write-Host "Hardening completed"
