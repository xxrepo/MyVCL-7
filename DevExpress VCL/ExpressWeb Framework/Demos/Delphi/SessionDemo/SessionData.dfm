object SessionDataMod: TSessionDataMod
  OldCreateOrder = True
  OnCreate = cxWebHomeDataModuleCreate
  OnDestroy = cxWebHomeDataModuleDestroy
  OnSessionEnd = cxWebHomeDataModuleSessionEnd
  OnSessionStart = cxWebHomeDataModuleSessionStart
  Left = 50
  Top = 50
  Height = 350
  Width = 400
end
