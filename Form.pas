unit Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Account;

type
  TForm1 = class(TForm)
    Deposite: TButton;
    Withdraw: TButton;
    See_Transactions: TButton;
    Name: TEdit;
    Balance: TEdit;
    Create_account: TButton;
    Label1: TLabel;
    Status: TLabel;
    Label2: TLabel;
    Deposite_amount: TEdit;
    Withdraw_amount: TEdit;
    procedure Create_accountClick(Sender: TObject);
    procedure DepositeClick(Sender: TObject);
    procedure WithdrawClick(Sender: TObject);
    procedure See_TransactionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  newAccountCreated: TAccount;
  ListBox1: TListBox;
  Transactions: TLabel;

implementation

{$R *.dfm}

procedure TForm1.Create_accountClick(Sender: TObject);
begin

  newAccountCreated := TAccount.Create('Ashis', 123, 456, 200);

  Label1.Caption := newAccountCreated.GetName;

  Label2.Caption := CurrToStr(newAccountCreated.GetBalance);

  //free transactions label and box
  ListBox1.Free;

  Transactions.Free;

end;


procedure TForm1.DepositeClick(Sender: TObject);
begin

var amountToDeposite: Currency;

   amountToDeposite := StrToCurr(Deposite_amount.Text);

if amountToDeposite > 0 then
begin
  var new_balance: Currency := newAccountCreated.Deposite(amountToDeposite);

  Label2.Caption := CurrToStr(new_balance);


  var transactions: TArray<string> := newAccountCreated.GetTransactions;
  begin
    SetLength(transactions, Length(transactions)+1);
    transactions[High(transactions)] := 'deposite: ' + Deposite_amount.Text;
  end;

  newAccountCreated.SetTransactions(transactions);

  ShowMessage( 'deposite: ' + Deposite_amount.Text);
end
else
begin
  ShowMessage('please enter a positive amount');
end;

end;

procedure TForm1.See_TransactionsClick(Sender: TObject);
begin

    //create transactions label
    Transactions := TLabel.Create(self);
    Transactions.Parent := Self;
    Transactions.Name := 'Transactions';
    Transactions.Top := 150;
    Transactions.Left := 250;
    Transactions.Font.Size := 18;

    //create box to show transactions
    ListBox1 := TListBox.Create(self);
    ListBox1.Parent := Self;
    ListBox1.Top := 200;
    ListBox1.Left := 250;
    ListBox1.Height := 200;
    ListBox1.Width := 250;

    //create a list of transactions
  var transactions: TArray<string> := newAccountCreated.GetTransactions;
    begin
      var i: integer;
      for i := 0 to Length(transactions)-1 do
        begin
          var name: string := 'myText' + IntToStr(i);
            begin
              var myText : TLabel;
                begin
                  myText := TLabel.Create(self);
                  myText.Name := name;
                  myText.Parent := ListBox1;
                  myText.Caption := transactions[i];
                  myText.Top := i * 30;
                end;

            end;
        end;
    end;

end;


procedure TForm1.WithdrawClick(Sender: TObject);
begin

var amountToWithdraw: Currency := StrToCurr(Withdraw_amount.Text);

if amountToWithdraw <= 0 then
begin
  ShowMessage('please enter a positive amount.');
end
else if amountToWithdraw > newAccountCreated.GetBalance then
begin
  ShowMessage('not sufficient fund available.');
end
else
begin
  var new_balance: Currency;
  new_balance := newAccountCreated.Withdraw(amountToWithdraw);

  Label2.Caption := CurrToStr(new_balance);

  var transactions: TArray<string> := newAccountCreated.GetTransactions;
  begin
    SetLength(transactions, Length(transactions)+1);
    transactions[High(transactions)] := 'withdraw: ' + Withdraw_amount.Text;
  end;

  newAccountCreated.SetTransactions(transactions);

  ShowMessage( 'withdraw: ' + Withdraw_amount.Text);
end;
end;

end.
