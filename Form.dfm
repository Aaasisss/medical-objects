object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 298
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 256
    Top = 27
    Width = 3
    Height = 13
  end
  object Status: TLabel
    Left = 178
    Top = 2
    Width = 43
    Height = 19
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 256
    Top = 57
    Width = 3
    Height = 13
  end
  object Deposite: TButton
    Left = 8
    Top = 89
    Width = 75
    Height = 25
    Caption = 'Deposite'
    TabOrder = 0
    OnClick = DepositeClick
  end
  object Withdraw: TButton
    Left = 8
    Top = 137
    Width = 75
    Height = 25
    Caption = 'Withdraw'
    TabOrder = 1
    OnClick = WithdrawClick
  end
  object See_Transactions: TButton
    Left = 8
    Top = 184
    Width = 105
    Height = 25
    Caption = 'See Transactions'
    TabOrder = 2
    OnClick = See_TransactionsClick
  end
  object Name: TEdit
    Left = 178
    Top = 27
    Width = 57
    Height = 21
    TabOrder = 3
    Text = 'Name'
  end
  object Balance: TEdit
    Left = 178
    Top = 54
    Width = 57
    Height = 21
    TabOrder = 4
    Text = 'Balance'
  end
  object Create_account: TButton
    Left = 8
    Top = 34
    Width = 97
    Height = 25
    Caption = 'Create Account'
    TabOrder = 5
    OnClick = Create_accountClick
  end
  object Deposite_amount: TEdit
    Left = 89
    Top = 91
    Width = 57
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object Withdraw_amount: TEdit
    Left = 89
    Top = 139
    Width = 57
    Height = 21
    TabOrder = 7
    Text = '0'
  end
end
