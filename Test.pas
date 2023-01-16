unit Test;

interface

uses
  DUnitX.TestFramework, Account, SysUtils;

type
  [TestFixture]
  TMyTestObject = class
  private
    FAccount: TAccount;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure ObjectIsNotNull;
    [Test]
    procedure DoesNotRaiseException;
    [Test]
    procedure DepositesPositiveAmount;
    [Test]
    procedure WithdrawsPositiveAmount;
    [Test]
    procedure PreventsOverdrawing;
    [Test]
    procedure PreventsNegativeAmountDeposite;

  end;

implementation

procedure TMyTestObject.DoesNotRaiseException;
begin
  Assert.WillNotRaise(procedure begin FAccount.Create('someone',123,456,200) end, Exception);
end;

procedure TMyTestObject.DepositesPositiveAmount;
begin
  FAccount.Deposite(200);
  Assert.AreEqual(CurrToStr(400), CurrToStr(FAccount.GetBalance));
end;

procedure TMyTestObject.ObjectIsNotNull;
begin
  Assert.IsNotNull(FAccount);
end;

procedure TMyTestObject.PreventsNegativeAmountDeposite;
begin
  FAccount.Deposite(-200);
  Assert.AreEqual(CurrToStr(200), CurrToStr(FAccount.GetBalance));
end;

procedure TMyTestObject.PreventsOverdrawing;
begin
  FAccount.Withdraw(201);
  Assert.AreEqual(CurrToStr(200), CurrToStr(FAccount.GetBalance));
end;

procedure TMyTestObject.WithdrawsPositiveAmount;
begin
  FAccount.Withdraw(100);
  Assert.AreEqual(CurrToStr(100), CurrToStr(FAccount.GetBalance));
end;

procedure TMyTestObject.Setup;
begin
  FAccount := TAccount.Create('someone',123,456,200);
end;

procedure TMyTestObject.TearDown;
begin
  FAccount.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);

end.
