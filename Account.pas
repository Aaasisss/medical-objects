unit Account;

interface

type
  TAccount = class
  private
    FAccount_id, FName, FAddress, FContact, FEmail: string;
    FBsb, FAccount_number: integer;
    FBalance: Currency;
    FTransactions: TArray<string>;
    FCreate_date_time: TDateTime;
  public
    constructor Create(AName: string; ABsb, AAccount_number: integer; ABalance: Currency);

    function GetBsb(): integer;
    function GetName(): string;
    function GetBalance(): Currency;
    function GetTransactions(): TArray<string>;
    procedure SetTransactions(ATransaction: TArray<string>);

    function Deposite(x: Currency): Currency;
    function Withdraw(x: Currency): Currency;

  end;

implementation

uses
  System.SysUtils;

{ TAccount }

constructor TAccount.Create(AName: string; ABsb, AAccount_number: integer; ABalance: Currency);
begin
  inherited Create;

  FName := AName;
  FBsb := ABsb;
  FAccount_number := AAccount_number;
  FBalance := ABalance;
end;

function TAccount.GetBalance: Currency;
begin
 Result := FBalance;
end;

function TAccount.GetBsb: integer;
begin
  Result := FBsb;
end;

function TAccount.GetName: string;
begin
 Result := FName;
end;

function TAccount.GetTransactions: TArray<string>;
begin
 Result := FTransactions;
end;

procedure TAccount.SetTransactions(ATransaction: TArray<string>);
begin
  FTransactions := ATransaction;
end;

function TAccount.Deposite(x: Currency): Currency;
begin
if x > 0 then
  begin
    FBalance := FBalance + x;
  end;

  Result := FBalance;
end;

function TAccount.Withdraw(x: Currency): Currency;
begin
if (x > 0) and (x <= FBalance) then
  begin
       FBalance := FBalance - x;
  end;

  Result := FBalance;
end;

end.
