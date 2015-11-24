object DMMain: TDMMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 320
  Width = 418
  object fdmPropertyTypeList: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 336
    Top = 40
    object fdmPropertyTypeListID: TAutoIncField
      FieldName = 'ID'
    end
    object fdmPropertyTypeListTYPE_STRING: TWideStringField
      FieldName = 'TYPE_STRING'
      Size = 255
    end
  end
  object fdmProperties: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 56
    Top = 104
    object fdmPropertiesID: TAutoIncField
      FieldName = 'ID'
    end
    object fdmPropertiesPROPERTY_NAME: TWideStringField
      FieldName = 'PROPERTY_NAME'
      Size = 255
    end
    object fdmPropertiesPROPERTY_TYPE_ID: TIntegerField
      FieldName = 'PROPERTY_TYPE_ID'
    end
    object fdmPropertiesPROPERTY_TYPE: TWideStringField
      FieldKind = fkLookup
      FieldName = 'PROPERTY_TYPE'
      LookupDataSet = fdmPropertyTypeList
      LookupKeyFields = 'ID'
      LookupResultField = 'TYPE_STRING'
      KeyFields = 'PROPERTY_TYPE_ID'
      Size = 255
      Lookup = True
    end
  end
  object DSProperties: TDataSource
    DataSet = fdmProperties
    Left = 104
    Top = 64
  end
end
