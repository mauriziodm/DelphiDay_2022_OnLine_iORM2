unit Model.Customer;

interface

uses
  iORM;

type

  [ioEntity]
  TCustomer = class
  private
    FID: Integer;
    FName: String;
    FCity: String;
    FAddress: String;
    FPhoneNumber: String;
//    FAge: Integer;
    function GetFullAddress: String;
  public
    constructor Create;
    property ID: Integer read FID;  // ReadOnly
    property Name: String read FName write FName;
    property City: String read FCity write FCity;
    property Address: String read FAddress write FAddress;
    property FullAddress: String read GetFullAddress;  // ReadOnly - Not mapped
    property PhoneNumber: String read FPhoneNumber write FPhoneNumber;
//    property Age: Integer read FAge write FAge;
  end;

implementation

uses
  System.SysUtils;

{ TCustomer }

constructor TCustomer.Create;
begin
//  Sleep(5);
end;

function TCustomer.GetFullAddress: String;
begin
  Result := Format('%s, %s', [FCity, FAddress]);
end;

end.
