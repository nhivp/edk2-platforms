## @file
#  AmdMinBoardPkg.dsc
#
#  Description file for AMD AmdMinBoardPkg
#
#  Copyright (c) 2023, Advanced Micro Devices, Inc. All rights reserved.
#  SPDX-License-Identifier: BSD-2-Clause-Patent
##

[Defines]
  DSC_SPECIFICATION           = 1.30
  PLATFORM_GUID               = 939B559B-269B-4B8F-9637-44DF6575C1E2
  PLATFORM_NAME               = AmdMinBoardPkg
  PLATFORM_VERSION            = 0.1
  OUTPUT_DIRECTORY            = Build/$(PLATFORM_NAME)
  BUILD_TARGETS               = DEBUG | RELEASE | NOOPT
  SUPPORTED_ARCHITECTURES     = IA32 | X64

[Packages]
  AmdMinBoardPkg/AmdMinBoardPkg.dec
  MdePkg/MdePkg.dec
  MinPlatformPkg/MinPlatformPkg.dec
  UefiCpuPkg/UefiCpuPkg.dec

[PcdsDynamicDefault]
  gEfiMdePkgTokenSpaceGuid.PcdPciExpressBaseSize|0x10000000

[LibraryClasses]
  SpcrDeviceLib|AmdMinBoardPkg/Library/SpcrDeviceLib/SpcrDeviceLib.inf
  ReportFvLib|AmdMinBoardPkg/Library/PeiReportFvLib/PeiReportFvLib.inf

[LibraryClasses.common]
  BaseLib|MdePkg/Library/BaseLib/BaseLib.inf
  BaseMemoryLib|MdePkg/Library/BaseMemoryLibRepStr/BaseMemoryLibRepStr.inf
  DebugLib|MdePkg/Library/BaseDebugLibNull/BaseDebugLibNull.inf
  MemoryAllocationLib|MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
  PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
  RegisterFilterLib|MdePkg/Library/RegisterFilterLibNull/RegisterFilterLibNull.inf
  UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntryPoint.inf

[LibraryClasses.common.PEIM]
  SetCacheMtrrLib|AmdMinBoardPkg/Library/SetCacheMtrrLib/SetCacheMtrrLib.inf
  BoardInitLib|AmdMinBoardPkg/Library/PeiBoardInitPreMemLib/PeiBoardInitPreMemLib.inf

[LibraryClasses.common.DXE_DRIVER]
  BoardBdsHookLib|AmdMinBoardPkg/Library/BoardBdsHookLib/BoardBdsHookLib.inf
  BoardInitLib|AmdMinBoardPkg/Library/DxeBoardInitLib/DxeBoardInitLib.inf

[Components]
  AmdMinBoardPkg/Library/SpcrDeviceLib/SpcrDeviceLib.inf

[Components.IA32]
  AmdMinBoardPkg/Library/SetCacheMtrrLib/SetCacheMtrrLib.inf
  AmdMinBoardPkg/Library/PeiReportFvLib/PeiReportFvLib.inf
  AmdMinBoardPkg/Library/PeiBoardInitPreMemLib/PeiBoardInitPreMemLib.inf

[Components.X64]
  AmdMinBoardPkg/Library/DxeBoardInitLib/DxeBoardInitLib.inf
  AmdMinBoardPkg/Library/BoardBdsHookLib/BoardBdsHookLib.inf
  AmdMinBoardPkg/PciHotPlug/PciHotPlugInit.inf