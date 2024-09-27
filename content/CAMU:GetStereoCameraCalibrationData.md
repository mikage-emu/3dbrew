+++
title = 'CAMU:GetStereoCameraCalibrationData'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002B0000\] |

# Response

| Index Word | Description                                                                           |
|------------|---------------------------------------------------------------------------------------|
| 0          | Header code                                                                           |
| 1          | Result code                                                                           |
| 2-17       | [StereoCameraCalibrationData](Camera_Services#StereoCameraCalibrationData "wikilink") |