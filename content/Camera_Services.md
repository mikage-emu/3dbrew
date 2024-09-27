+++
title = 'Camera Services'
+++

## cam:c (PORT_REG)

Same as [cam:u](#camu_port_user "wikilink")

## cam:s (PORT_CAL)

Same as [cam:u](#camu_port_user "wikilink")

## cam:q (PORT_QTM)

This was added with New3DS.

| Command Header | Description                                                                                  |
|----------------|----------------------------------------------------------------------------------------------|
| 0x00010040     | [StartCapture](CAMU:StartCapture "wikilink")                                                 |
| 0x00020040     | [StopCapture](CAMU:StopCapture "wikilink")                                                   |
| 0x0003004?     | [IsBusy](CAMU:IsBusy "wikilink")                                                             |
| 0x00040040     | [ClearBuffer](CAMU:ClearBuffer "wikilink")                                                   |
| 0x0005004?     | [GetVsyncInterruptEvent](CAMU:GetVsyncInterruptEvent "wikilink")                             |
| 0x0006004?     | [GetBufferErrorInterruptEvent](CAMU:GetBufferErrorInterruptEvent "wikilink")                 |
| 0x0007????     | [StartRecieving](CAMU:StartRecieving "wikilink")                                             |
| 0x00080040     | [IsFinishedRecieving](CAMU:IsFinishedRecieving "wikilink")                                   |
| 0x00090100     | [SetTransferLines](CAMU:SetTransferLines "wikilink")                                         |
| 0x000A008?     | [GetMaxLines](CAMU:GetMaxLines "wikilink")                                                   |
| 0x000B0100     | [SetTransferBytes](CAMU:SetTransferBytes "wikilink")                                         |
| 0x000C004?     | [GetTransferBytes](CAMU:GetTransferBytes "wikilink")                                         |
| 0x000D008?     | [GetMaxBytes](CAMU:GetMaxBytes "wikilink")                                                   |
| 0x000E0080     | [SetTrimming](CAMU:SetTrimming "wikilink")                                                   |
| 0x000F004?     | [IsTrimming](CAMU:IsTrimming "wikilink")                                                     |
| 0x00100140     | [SetTrimmingParams](CAMU:SetTrimmingParams "wikilink")                                       |
| 0x0011????     | [GetTrimmingParams](CAMU:GetTrimmingParams "wikilink")                                       |
| 0x00120140     | [SetTrimmingParamsCenter](CAMU:SetTrimmingParamsCenter "wikilink")                           |
| 0x00130040     | [Activate](CAMU:Activate "wikilink")                                                         |
| 0x00140080     | [SwitchContext](CAMU:SwitchContext "wikilink")                                               |
| 0x00150080     | [SetExposure](CAMU:SetExposure "wikilink")                                                   |
| 0x00160080     | [SetWhiteBalance](CAMU:SetWhiteBalance "wikilink")                                           |
| 0x00170080     | [SetSharpness](CAMU:SetSharpness "wikilink")                                                 |
| 0x00180080     | [SetAutoExposure](CAMU:SetAutoExposure "wikilink")                                           |
| 0x0019004?     | [IsAutoExposure](CAMU:IsAutoExposure "wikilink")                                             |
| 0x001A0080     | [SetAutoWhiteBalance](CAMU:SetAutoWhiteBalance "wikilink")                                   |
| 0x001B004?     | [IsAutoWhiteBalance](CAMU:IsAutoWhiteBalance "wikilink")                                     |
| 0x001C00C0     | [FlipImage](CAMU:FlipImage "wikilink")                                                       |
| 0x001D020?     | [SetDetailSize](CAMU:SetDetailSize "wikilink")                                               |
| 0x001E00C0     | [SetSize](CAMU:SetSize "wikilink")                                                           |
| 0x001F0080     | [SetFrameRate](CAMU:SetFrameRate "wikilink")                                                 |
| 0x00200080     | [SetPhotoMode](CAMU:SetPhotoMode "wikilink")                                                 |
| 0x002100C0     | [SetEffect](CAMU:SetEffect "wikilink")                                                       |
| 0x00220080     | [SetContrast](CAMU:SetContrast "wikilink")                                                   |
| 0x00230080     | [SetLensCorrection](CAMU:SetLensCorrection "wikilink")                                       |
| 0x002400C0     | [SetOutputFormat](CAMU:SetOutputFormat "wikilink")                                           |
| 0x0025014?     | [SetAutoExposureWindow](CAMU:SetAutoExposureWindow "wikilink")                               |
| 0x0026014?     | [SetAutoWhiteBalanceWindow](CAMU:SetAutoWhiteBalanceWindow "wikilink")                       |
| 0x00270080     | [SetNoiseFilter](CAMU:SetNoiseFilter "wikilink")                                             |
| 0x00280080     | [SyncronizeVsyncTiming](CAMU:SyncronizeVsyncTiming "wikilink")                               |
| 0x0029????     | [GetLatestVsyncTiming](CAMU:GetLatestVsyncTiming "wikilink")                                 |
| 0x002A????     | [GetStereoCallibrationData](CAMU:GetStereoCallibrationData "wikilink")                       |
| 0x002B????     | [SetPackageParameterWithoutContext](CAMU:SetPackageParameterWithoutContext "wikilink")       |
| 0x002C0080     | [SetPackageParameterWithContext](CAMU:SetPackageParameterWithContext "wikilink")             |
| 0x002D????     | [SetPackageParameterWithContextDetail](CAMU:SetPackageParameterWithContextDetail "wikilink") |
| 0x002E???      | [GetSuitableY2RStandardCoeffecient](CAMU:GetSuitableY2RStandardCoeffecient "wikilink")       |
| 0x002F         | [PlayShutterSoundWithWave](CAMU:PlayShutterSoundWithWave "wikilink")                         |
| 0x0030????     | [GetShutterSound](CAMU:PlayShutterSound "wikilink")                                          |
| 0x0031000?     | [DriverInitialize](CAMU:DriverInitailize "wikilink")                                         |
| 0x0032000?     | [DriverFinalize](CAMU:DriverFinalize "wikilink")                                             |
| 0x0033000?     | [GetActivatedCamera](CAMU:GetActivatedCamera "wikilink")                                     |
| 0x0034000?     | [GetSleepCamera](CAMU:GetSleepCamera "wikilink")                                             |
| 0x00350040     | [SetSleepCamera](CAMU:SetSleepCamera "wikilink")                                             |
| 0x00360040     | [SetBrightnessSyncronization](CAMU:SetBrightnessSyncronization "wikilink")                   |
| 0x0037004?     | ???                                                                                          |
| 0x0038000?     | ???                                                                                          |
| 0x0039004?     | ???                                                                                          |
| 0x003A0080     | ???                                                                                          |
| 0x003B004?     | ???                                                                                          |
| 0x003C0080     | ???                                                                                          |
| 0x003D000?     | ???                                                                                          |
| 0x003E0000     | ???                                                                                          |

Most commands are same as cam:u, although, with different command
headers since some commands which are available in cam:u do not exist in
cam:q

## cam:u (PORT_USER)

| Command Header | Description                                                                                  |
|----------------|----------------------------------------------------------------------------------------------|
| 0x00010040     | [StartCapture](CAMU:StartCapture "wikilink")                                                 |
| 0x00020040     | [StopCapture](CAMU:StopCapture "wikilink")                                                   |
| 0x00030040     | [IsBusy](CAMU:IsBusy "wikilink")                                                             |
| 0x00040040     | [ClearBuffer](CAMU:ClearBuffer "wikilink")                                                   |
| 0x00050040     | [GetVsyncInterruptEvent](CAMU:GetVsyncInterruptEvent "wikilink")                             |
| 0x00060040     | [GetBufferErrorInterruptEvent](CAMU:GetBufferErrorInterruptEvent "wikilink")                 |
| 0x00070102     | [SetReceiving](CAMU:SetReceiving "wikilink")                                                 |
| 0x00080040     | [IsFinishedReceiving](CAMU:IsFinishedReceiving "wikilink")                                   |
| 0x00090100     | [SetTransferLines](CAMU:SetTransferLines "wikilink")                                         |
| 0x000A0080     | [GetMaxLines](CAMU:GetMaxLines "wikilink")                                                   |
| 0x000B0100     | [SetTransferBytes](CAMU:SetTransferBytes "wikilink")                                         |
| 0x000C0040     | [GetTransferBytes](CAMU:GetTransferBytes "wikilink")                                         |
| 0x000D0080     | [GetMaxBytes](CAMU:GetMaxBytes "wikilink")                                                   |
| 0x000E0080     | [SetTrimming](CAMU:SetTrimming "wikilink")                                                   |
| 0x000F0040     | [IsTrimming](CAMU:IsTrimming "wikilink")                                                     |
| 0x00100140     | [SetTrimmingParams](CAMU:SetTrimmingParams "wikilink")                                       |
| 0x00110040     | [GetTrimmingParams](CAMU:GetTrimmingParams "wikilink")                                       |
| 0x00120140     | [SetTrimmingParamsCenter](CAMU:SetTrimmingParamsCenter "wikilink")                           |
| 0x00130040     | [Activate](CAMU:Activate "wikilink")                                                         |
| 0x00140080     | [SwitchContext](CAMU:SwitchContext "wikilink")                                               |
| 0x00150080     | [SetExposure](CAMU:SetExposure "wikilink")                                                   |
| 0x00160080     | [SetWhiteBalance](CAMU:SetWhiteBalance "wikilink")                                           |
| 0x00170080     | [SetWhiteBalanceWithoutBaseUp](CAMU:SetWhiteBalanceWithoutBaseUp "wikilink")                 |
| 0x00180080     | [SetSharpness](CAMU:SetSharpness "wikilink")                                                 |
| 0x00190080     | [SetAutoExposure](CAMU:SetAutoExposure "wikilink")                                           |
| 0x001A0040     | [IsAutoExposure](CAMU:IsAutoExposure "wikilink")                                             |
| 0x001B0080     | [SetAutoWhiteBalance](CAMU:SetAutoWhiteBalance "wikilink")                                   |
| 0x001C0040     | [IsAutoWhiteBalance](CAMU:IsAutoWhiteBalance "wikilink")                                     |
| 0x001D00C0     | [FlipImage](CAMU:FlipImage "wikilink")                                                       |
| 0x001E0200     | [SetDetailSize](CAMU:SetDetailSize "wikilink")                                               |
| 0x001F00C0     | [SetSize](CAMU:SetSize "wikilink")                                                           |
| 0x00200080     | [SetFrameRate](CAMU:SetFrameRate "wikilink")                                                 |
| 0x00210080     | [SetPhotoMode](CAMU:SetPhotoMode "wikilink")                                                 |
| 0x002200C0     | [SetEffect](CAMU:SetEffect "wikilink")                                                       |
| 0x00230080     | [SetContrast](CAMU:SetContrast "wikilink")                                                   |
| 0x00240080     | [SetLensCorrection](CAMU:SetLensCorrection "wikilink")                                       |
| 0x002500C0     | [SetOutputFormat](CAMU:SetOutputFormat "wikilink")                                           |
| 0x00260140     | [SetAutoExposureWindow](CAMU:SetAutoExposureWindow "wikilink")                               |
| 0x00270140     | [SetAutoWhiteBalanceWindow](CAMU:SetAutoWhiteBalanceWindow "wikilink")                       |
| 0x00280080     | [SetNoiseFilter](CAMU:SetNoiseFilter "wikilink")                                             |
| 0x00290080     | [SynchronizeVsyncTiming](CAMU:SynchronizeVsyncTiming "wikilink")                             |
| 0x002A0080     | [GetLatestVsyncTiming](CAMU:GetLatestVsyncTiming "wikilink")                                 |
| 0x002B0000     | [GetStereoCameraCalibrationData](CAMU:GetStereoCameraCalibrationData "wikilink")             |
| 0x002C0400     | [SetStereoCameraCalibrationData](CAMU:SetStereoCameraCalibrationData "wikilink")             |
| 0x002D00C0     | [WriteRegisterI2c](CAMU:WriteRegisterI2c "wikilink")                                         |
| 0x002E00C0     | [WriteMcuVariableI2c](CAMU:WriteMcuVariableI2c "wikilink")                                   |
| 0x002F0080     | [ReadRegisterI2cExclusive](CAMU:ReadRegisterI2cExclusive "wikilink")                         |
| 0x00300080     | [ReadMcuVariableI2cExclusive](CAMU:ReadMcuVariableI2cExclusive "wikilink")                   |
| 0x00310180     | [SetImageQualityCalibrationData](CAMU:SetImageQualityCalibrationData "wikilink")             |
| 0x00320000     | [GetImageQualityCalibrationData](CAMU:GetImageQualityCalibrationData "wikilink")             |
| 0x003302C0     | [SetPackageParameterWithoutContext](CAMU:SetPackageParameterWithoutContext "wikilink")       |
| 0x00340140     | [SetPackageParameterWithContext](CAMU:SetPackageParameterWithContext "wikilink")             |
| 0x003501C0     | [SetPackageParameterWithContextDetail](CAMU:SetPackageParameterWithContextDetail "wikilink") |
| 0x00360000     | [GetSuitableY2rStandardCoefficient](CAMU:GetSuitableY2rStandardCoefficient "wikilink")       |
| 0x00370202     | [PlayShutterSoundWithWave](CAMU:PlayShutterSoundWithWave "wikilink")                         |
| 0x00380040     | [PlayShutterSound](CAMU:PlayShutterSound "wikilink")                                         |
| 0x00390000     | [DriverInitialize](CAMU:DriverInitialize "wikilink")                                         |
| 0x003A0000     | [DriverFinalize](CAMU:DriverFinalize "wikilink")                                             |
| 0x003B0000     | [GetActivatedCamera](CAMU:GetActivatedCamera "wikilink")                                     |
| 0x003C0000     | [GetSleepCamera](CAMU:GetSleepCamera "wikilink")                                             |
| 0x003D0040     | [SetSleepCamera](CAMU:SetSleepCamera "wikilink")                                             |
| 0x003E0040     | [SetBrightnessSynchronization](CAMU:SetBrightnessSynchronization "wikilink")                 |
| 0x003F0040     | Stubbed, always returns 0                                                                    |
| 0x004000C0     | ???                                                                                          |
| 0x00410040     | Stubbed, returns D8A053EA if flag is not 1                                                   |
| 0x00420040     | ???                                                                                          |
| 0x00430000     | Stubbed, returns D8A053EA if flag is not 1                                                   |
| 0x00440000     | Stubbed, returns D8A053EA if flag is not 1                                                   |

### Port

| Enum      | Value                  |
|-----------|------------------------|
| PORT_NONE | 0x0                    |
| PORT_CAM1 | 0x1 \<\< 0x0           |
| PORT_CAM2 | 0x1 \<\< 0x1           |
| PORT_BOTH | PORT_CAM1 \| PORT_CAM2 |

### CameraSelect

| Enum             | Value                                    |
|------------------|------------------------------------------|
| SELECT_NONE      | 0x0                                      |
| SELECT_OUT1      | 0x1 \<\< 0x0                             |
| SELECT_IN1       | 0x1 \<\< 0x1                             |
| SELECT_OUT2      | 0x1 \<\< 0x2                             |
| SELECT_IN1_OUT1  | SELECT_OUT1 \| SELECT_IN1                |
| SELECT_OUT1_OUT2 | SELECT_OUT1 \| SELECT_OUT2               |
| SELECT_IN1_OUT2  | SELECT_IN1 \| SELECT_OUT2                |
| SELECT_ALL       | SELECT_OUT1 \| SELECT_IN1 \| SELECT_OUT2 |

### Context

| Enum         | Value                  |
|--------------|------------------------|
| CONTEXT_NONE | 0x0                    |
| CONTEXT_A    | 0x1 \<\< 0x0           |
| CONTEXT_B    | 0x1 \<\< 0x1           |
| CONTEXT_BOTH | CONTEXT_A \| CONTEXT_B |

### Flip

| Enum            | Value |
|-----------------|-------|
| FLIP_NONE       | 0x0   |
| FLIP_HORIZONTAL | 0x1   |
| FLIP_VERTICAL   | 0x2   |
| FLIP_REVERSE    | 0x3   |

### Size

| Enum                | Value     |
|---------------------|-----------|
| SIZE_VGA            | 0x0       |
| SIZE_QVGA           | 0x1       |
| SIZE_QQVGA          | 0x2       |
| SIZE_CIF            | 0x3       |
| SIZE_QCIF           | 0x4       |
| SIZE_DS_LCD         | 0x5       |
| SIZE_DS_LCDx4       | 0x6       |
| SIZE_CTR_TOP_LCD    | 0x7       |
| SIZE_CTR_BOTTOM_LCD | SIZE_QVGA |

### FrameRate

| Enum                | Value |
|---------------------|-------|
| FRAME_RATE_15       | 0x0   |
| FRAME_RATE_15_TO_5  | 0x1   |
| FRAME_RATE_15_TO_2  | 0x2   |
| FRAME_RATE_10       | 0x3   |
| FRAME_RATE_8_5      | 0x4   |
| FRAME_RATE_5        | 0x5   |
| FRAME_RATE_20       | 0x6   |
| FRAME_RATE_20_TO_5  | 0x7   |
| FRAME_RATE_30       | 0x8   |
| FRAME_RATE_30_TO_5  | 0x9   |
| FRAME_RATE_15_TO_10 | 0xA   |
| FRAME_RATE_20_TO_10 | 0xB   |
| FRAME_RATE_30_TO_10 | 0xC   |

### WhiteBalance

| Enum                                  | Value               |
|---------------------------------------|---------------------|
| WHITE_BALANCE_AUTO                    | 0x0                 |
| WHITE_BALANCE_3200K                   | 0x1                 |
| WHITE_BALANCE_4150K                   | 0x2                 |
| WHITE_BALANCE_5200K                   | 0x3                 |
| WHITE_BALANCE_6000K                   | 0x4                 |
| WHITE_BALANCE_7000K                   | 0x5                 |
| WHITE_BALANCE_MAX                     | 0x6                 |
| WHITE_BALANCE_NORMAL                  | WHITE_BALANCE_AUTO  |
| WHITE_BALANCE_TUNGSTEN                | WHITE_BALANCE_3200K |
| WHITE_BALANCE_WHITE_FLUORESCENT_LIGHT | WHITE_BALANCE_4150K |
| WHITE_BALANCE_DAYLIGHT                | WHITE_BALANCE_5200K |
| WHITE_BALANCE_CLOUDY                  | WHITE_BALANCE_6000K |
| WHITE_BALANCE_HORIZON                 | WHITE_BALANCE_6000K |
| WHITE_BALANCE_SHADE                   | WHITE_BALANCE_7000K |

### PhotoMode

| Enum                 | Value |
|----------------------|-------|
| PHOTO_MODE_NORMAL    | 0x0   |
| PHOTO_MODE_PORTRAIT  | 0x1   |
| PHOTO_MODE_LANDSCAPE | 0x2   |
| PHOTO_MODE_NIGHTVIEW | 0x3   |
| PHOTO_MODE_LETTER    | 0x4   |

### Effect

| Enum            | Value |
|-----------------|-------|
| EFFECT_NONE     | 0x0   |
| EFFECT_MONO     | 0x1   |
| EFFECT_SEPIA    | 0x2   |
| EFFECT_NEGATIVE | 0x3   |
| EFFECT_NEGAFILM | 0x4   |
| EFFECT_SEPIA01  | 0x5   |

### Contrast

| Enum                | Value               |
|---------------------|---------------------|
| CONTRAST_PATTERN_01 | 0x0                 |
| CONTRAST_PATTERN_02 | 0x1                 |
| CONTRAST_PATTERN_03 | 0x2                 |
| CONTRAST_PATTERN_04 | 0x3                 |
| CONTRAST_PATTERN_05 | 0x4                 |
| CONTRAST_PATTERN_06 | 0x5                 |
| CONTRAST_PATTERN_07 | 0x6                 |
| CONTRAST_PATTERN_08 | 0x7                 |
| CONTRAST_PATTERN_09 | 0x8                 |
| CONTRAST_PATTERN_10 | 0x9                 |
| CONTRAST_PATTERN_11 | 0xA                 |
| CONTRAST_LOW        | CONTRAST_PATTERN_05 |
| CONTRAST_NORMAL     | CONTRAST_PATTERN_06 |
| CONTRAST_HIGH       | CONTRAST_PATTERN_07 |

### LensCorrection

| Enum                   | Value                 |
|------------------------|-----------------------|
| LENS_CORRECTION_OFF    | 0x0                   |
| LENS_CORRECTION_ON_70  | 0x1                   |
| LENS_CORRECTION_ON_90  | 0x2                   |
| LENS_CORRECTION_DARK   | LENS_CORRECTION_OFF   |
| LENS_CORRECTION_NORMAL | LENS_CORRECTION_ON_70 |
| LENS_CORRECTION_BRIGHT | LENS_CORRECTION_ON_90 |

### OutputFormat

| Enum           | Value |
|----------------|-------|
| OUTPUT_YUV_422 | 0x0   |
| OUTPUT_RGB_565 | 0x1   |

### ShutterSoundType

| Enum                         | Value |
|------------------------------|-------|
| SHUTTER_SOUND_TYPE_NORMAL    | 0x0   |
| SHUTTER_SOUND_TYPE_MOVIE     | 0x1   |
| SHUTTER_SOUND_TYPE_MOVIE_END | 0x2   |

### ImageQualityCalibrationData

| Type | Field          |
|------|----------------|
| s16  | aeBaseTarget   |
| s16  | kRL            |
| s16  | kGL            |
| s16  | kBL            |
| s16  | ccmPosition    |
| u16  | awbCcmL9Right  |
| u16  | awbCcmL9Left   |
| u16  | awbCcmL10Right |
| u16  | awbCcmL10Left  |
| u16  | awbX0Right     |
| u16  | awbX0Left      |

### StereoCameraCalibrationData

| Type      | Field             |
|-----------|-------------------|
| bool      | isValidRotationXY |
| bool\[3\] | reservedFlag      |
| float     | scale             |
| float     | rotationZ         |
| float     | translationX      |
| float     | translationY      |
| float     | rotationX         |
| float     | rotationY         |
| float     | angleOfViewRight  |
| float     | angleOfViewLeft   |
| float     | distanceToChart   |
| float     | distanceCameras   |
| s16       | imageWidth        |
| s16       | imageHeight       |
| u8\[16\]  | reserved          |

### PackageParameterCameraSelect

| Type | Field                                                                      |
|------|----------------------------------------------------------------------------|
| u8   | [CameraSelect](Camera_Services#cameraselect "wikilink") camera             |
| s8   | exposure                                                                   |
| u8   | [WhiteBalance](Camera_Services#whitebalance "wikilink") whiteBalance       |
| s8   | sharpness                                                                  |
| bool | autoExposureOn                                                             |
| bool | autoWhiteBalanceOn                                                         |
| u8   | [FrameRate](Camera_Services#framerate "wikilink") frameRate                |
| u8   | [PhotoMode](Camera_Services#photomode "wikilink") photoMode                |
| u8   | contrast                                                                   |
| u8   | [LensCorrection](Camera_Services#lenscorrection "wikilink") lensCorrection |
| bool | noiseFilterOn                                                              |
| u8   | padding                                                                    |
| s16  | autoExposureWindowX                                                        |
| s16  | autoExposureWindowY                                                        |
| s16  | autoExposureWindowWidth                                                    |
| s16  | autoExposureWindowHeight                                                   |
| s16  | autoWhiteBalanceWindowX                                                    |
| s16  | autoWhiteBalanceWindowY                                                    |
| s16  | autoWhiteBalanceWindowWidth                                                |
| s16  | autoWhiteBalanceWindowHeight                                               |

### PackageParameterContext

| Type | Field                                                          |
|------|----------------------------------------------------------------|
| u8   | [CameraSelect](Camera_Services#cameraselect "wikilink") camera |
| u8   | [Context](Camera_Services#context "wikilink") context          |
| u8   | [Flip](Camera_Services#flip "wikilink") flip                   |
| u8   | [Effect](Camera_Services#effect "wikilink") effect             |
| u8   | [Size](Camera_Services#size "wikilink") size                   |

### PackageParameterContextDetail

| Type | Field                                                          |
|------|----------------------------------------------------------------|
| u8   | [CameraSelect](Camera_Services#cameraselect "wikilink") camera |
| u8   | [Context](Camera_Services#context "wikilink") context          |
| u8   | [Flip](Camera_Services#flip "wikilink") flip                   |
| u8   | [Effect](Camera_Services#effect "wikilink") effect             |
| s16  | width                                                          |
| s16  | height                                                         |
| s16  | cropX0                                                         |
| s16  | cropY0                                                         |
| s16  | cropX1                                                         |
| s16  | cropY1                                                         |

## y2r:u

| Command Header | Description                                                                 |
|----------------|-----------------------------------------------------------------------------|
| 0x00010040     | [SetInputFormat](Y2R:SetInputFormat "wikilink")                             |
| 0x00020000     | [GetInputFormat](Y2R:GetInputFormat "wikilink")                             |
| 0x00030040     | [SetOutputFormat](Y2R:SetOutputFormat "wikilink")                           |
| 0x00040000     | [GetOutputFormat](Y2R:GetOutputFormat "wikilink")                           |
| 0x00050040     | [SetRotation](Y2R:SetRotation "wikilink")                                   |
| 0x00060000     | [GetRotation](Y2R:GetRotation "wikilink")                                   |
| 0x00070040     | [SetBlockAlignment](Y2R:SetBlockAlignment "wikilink")                       |
| 0x00080000     | [GetBlockAlignment](Y2R:GetBlockAlignment "wikilink")                       |
| 0x00090040     | [SetSpacialDithering](Y2R:SetSpacialDithering "wikilink")                   |
| 0x000A0000     | [GetSpacialDithering](Y2R:GetSpacialDithering "wikilink")                   |
| 0x000B0040     | [SetTemporalDithering](Y2R:SetTemporalDithering "wikilink")                 |
| 0x000C0000     | [GetTemporalDithering](Y2R:GetTemporalDithering "wikilink")                 |
| 0x000D0040     | [SetTransferEndInterrupt](Y2R:SetTransferEndInterrupt "wikilink")           |
| 0x000E0000     | [GetTransferEndInterrupt](Y2R:GetTransferEndInterrupt "wikilink")           |
| 0x000F0000     | [GetTransferEndEvent](Y2R:GetTransferEndEvent "wikilink")                   |
| 0x00100102     | [SetSendingY](Y2R:SetSendingY "wikilink")                                   |
| 0x00110102     | [SetSendingU](Y2R:SetSendingU "wikilink")                                   |
| 0x00120102     | [SetSendingV](Y2R:SetSendingV "wikilink")                                   |
| 0x00130102     | [SetSendingYuv](Y2R:SetSendingYuv "wikilink")                               |
| 0x00140000     | [IsFinishedSendingYuv](Y2R:IsFinishedSendingYuv "wikilink")                 |
| 0x00150000     | [IsFinishedSendingY](Y2R:IsFinishedSendingY "wikilink")                     |
| 0x00160000     | [IsFinishedSendingU](Y2R:IsFinishedSendingU "wikilink")                     |
| 0x00170000     | [IsFinishedSendingV](Y2R:IsFinishedSendingV "wikilink")                     |
| 0x00180102     | [SetReceiving](Y2R:SetReceiving "wikilink")                                 |
| 0x00190000     | [IsFinishedReceiving](Y2R:IsFinishedReceiving "wikilink")                   |
| 0x001A0040     | [SetInputLineWidth](Y2R:SetInputLineWidth "wikilink")                       |
| 0x001B0000     | [GetInputLineWidth](Y2R:GetInputLineWidth "wikilink")                       |
| 0x001C0040     | [SetInputLines](Y2R:SetInputLines "wikilink")                               |
| 0x001D0000     | [GetInputLines](Y2R:GetInputLines "wikilink")                               |
| 0x001E0100     | [SetCoefficientParams](Y2R:SetCoefficientParams "wikilink")                 |
| 0x001F0000     | [GetCoefficientParams](Y2R:GetCoefficientParams "wikilink")                 |
| 0x00200040     | [SetStandardCoefficient](Y2R:SetStandardCoefficient "wikilink")             |
| 0x00210040     | [GetStandardCoefficientParams](Y2R:GetStandardCoefficientParams "wikilink") |
| 0x00220040     | [SetAlpha](Y2R:SetAlpha "wikilink")                                         |
| 0x00230000     | [GetAlpha](Y2R:GetAlpha "wikilink")                                         |
| 0x00240200     | [SetDitheringWeightParams](Y2R:SetDitheringWeightParams "wikilink")         |
| 0x00250000     | [GetDitheringWeightParams](Y2R:GetDitheringWeightParams "wikilink")         |
| 0x00260000     | [StartConversion](Y2R:StartConversion "wikilink")                           |
| 0x00270000     | [StopConversion](Y2R:StopConversion "wikilink")                             |
| 0x00280000     | [IsBusyConversion](Y2R:IsBusyConversion "wikilink")                         |
| 0x002901C0     | [SetPackageParameter](Y2R:SetPackageParameter "wikilink")                   |
| 0x002A0000     | [PingProcess](Y2R:PingProcess "wikilink")                                   |
| 0x002B0000     | [DriverInitialize](Y2R:DriverInitialize "wikilink")                         |
| 0x002C0000     | [DriverFinalize](Y2R:DriverFinalize "wikilink")                             |
| 0x002D0000     | [GetPackageParameter](Y2R:GetPackageParameter "wikilink")                   |

### InputFormat

| Enum                  | Value |
|-----------------------|-------|
| INPUT_YUV422_INDIV_8  | 0x0   |
| INPUT_YUV420_INDIV_8  | 0x1   |
| INPUT_YUV422_INDIV_16 | 0x2   |
| INPUT_YUV420_INDIV_16 | 0x3   |
| INPUT_YUV422_BATCH    | 0x4   |

### OutputFormat

| Enum              | Value |
|-------------------|-------|
| OUTPUT_RGB_32     | 0x0   |
| OUTPUT_RGB_24     | 0x1   |
| OUTPUT_RGB_16_555 | 0x2   |
| OUTPUT_RGB_16_565 | 0x3   |

### Rotation

| Enum                   | Value |
|------------------------|-------|
| ROTATION_NONE          | 0x0   |
| ROTATION_CLOCKWISE_90  | 0x1   |
| ROTATION_CLOCKWISE_180 | 0x2   |
| ROTATION_CLOCKWISE_270 | 0x3   |

### BlockAlignment

| Enum         | Value | Description                                                                            |
|--------------|-------|----------------------------------------------------------------------------------------|
| BLOCK_LINE   | 0x0   | Output buffer's pixels are arranged linearly. Used when outputting to the framebuffer. |
| BLOCK_8_BY_8 | 0x1   | Output buffer's pixels are morton swizzled. Used when outputting to a GPU texture.     |

### CoefficientParams

| Type | Field    |
|------|----------|
| u16  | Y_A      |
| u16  | R_V      |
| u16  | G_V      |
| u16  | G_U      |
| u16  | B_U      |
| u16  | R_Offset |
| u16  | G_Offset |
| u16  | B_Offset |

### StandardCoefficient

| Enum                             | Value |
|----------------------------------|-------|
| COEFFICIENT_ITU_R_BT_601         | 0x0   |
| COEFFICIENT_ITU_R_BT_709         | 0x1   |
| COEFFICIENT_ITU_R_BT_601_SCALING | 0x2   |
| COEFFICIENT_ITU_R_BT_709_SCALING | 0x3   |

### DitheringWeightParams

| Type | Field          |
|------|----------------|
| u16  | w0_xEven_yEven |
| u16  | w0_xOdd_yEven  |
| u16  | w0_xEven_yOdd  |
| u16  | w0_xOdd_yOdd   |
| u16  | w1_xEven_yEven |
| u16  | w1_xOdd_yEven  |
| u16  | w1_xEven_yOdd  |
| u16  | w1_xOdd_yOdd   |
| u16  | w2_xEven_yEven |
| u16  | w2_xOdd_yEven  |
| u16  | w2_xEven_yOdd  |
| u16  | w2_xOdd_yOdd   |
| u16  | w3_xEven_yEven |
| u16  | w3_xOdd_yEven  |
| u16  | w3_xEven_yOdd  |
| u16  | w3_xOdd_yOdd   |

### PackageParameter

| Type | Field                                                                                     |
|------|-------------------------------------------------------------------------------------------|
| u8   | [InputFormat](Camera_Services#inputformat "wikilink") inputFormat                         |
| u8   | [OutputFormat](Camera_Services#outputformat_2 "wikilink") outputFormat                    |
| u8   | [Rotation](Camera_Services#rotation "wikilink") rotation                                  |
| u8   | [BlockAlignment](Camera_Services#blockalignment "wikilink") blockAlignment                |
| s16  | inputLineWidth                                                                            |
| s16  | inputLines                                                                                |
| u8   | [StandardCoefficient](Camera_Services#standardcoefficient "wikilink") standardCoefficient |
| u8   | padding                                                                                   |
| s16  | alpha                                                                                     |
