unit Model.Order;

interface

uses
  iORM, Model.Customer, Model.OrderRow, System.Generics.Collections, Model.Pizza,
  iORM.LazyLoad.Generics.ObjectList, ObjMapper.Attributes;

type

  [ioEntity('Orders')]
  TOrder = class
  private
    FID: Integer;
    FOrderDate: TDate;
    FCustomer: TCustomer;
    FRows: TObjectList<TOrderRow>;
    FNote: String;
{$region 'Persisted GrandTotal (LazyLoad)'}
//    [ioSkip] FRowsCalc: Boolean;
//    FGrandTotal: Currency;
//    FObjStatus: TioObjStatus;
{$endregion}
    function GetGrandTotal: Currency;
  public
    constructor Create;
    destructor Destroy; override;
{$region 'AddPizza (smartest)'}
//    procedure AddPizza(const APizza: TPizza);
{$endregion}
    property ID: Integer read FID write FID;  // ReadOnly
    property OrderDate: TDate read FOrderDate Write FOrderDate;
    property Customer: TCustomer read FCustomer write FCustomer;
    property Rows: TObjectList<TOrderRow> read FRows; // ReadOnly
    property Note: String read FNote write FNote;
    property GrandTotal: Currency read GetGrandTotal; // ReadOnly
  end;

implementation

uses
  System.SysUtils;

{ TOrder }

constructor TOrder.Create;
begin
  inherited;
  FOrderDate := Date;
  FRows := TObjectList<TOrderRow>.Create;
end;

destructor TOrder.Destroy;
begin
  FRows.Free;
  if FCustomer <> nil then
    FCustomer.Free;
  inherited;
end;

function TOrder.GetGrandTotal: Currency;
var
  LRow: TOrderRow;
begin
  Result := 0;
  for LRow in FRows do
    Result := Result + LRow.RowTotal;
end;

{$region 'Persisted GrandTotal (LazyLoad)'}
//function TOrder.GetGrandTotal: Currency;
//var
//  LRow: TOrderRow;
//  LPreviousValue: Currency;
//begin
//  LPreviousValue := FGrandTotal;
//  if (FRows.Count > 0) or FRowsCalc then
//  begin
//    FRowsCalc := True;
//    FGrandTotal := 0;
//    for LRow in FRows do
//      FGrandTotal := FGrandTotal + LRow.RowTotal;
//    if FGrandTotal <> LPreviousValue then
//      FObjStatus := osDirty;
//  end;
//  Result := FGrandTotal;
//end;
{$endregion}

{$region 'AddPizza (smartest)'}
//procedure TOrder.AddPizza(const APizza: TPizza);
//var
//  LRow: TOrderRow;
//begin
//  // If a row with the same pizza is present then increment its qty
//  for LRow in Rows do
//  begin
//    if LRow.PizzaID = APizza.ID then
//    begin
//      LRow.Qty := LRow.Qty + 1;
//      Exit;
//    end;
//  end;
//  // Else create a new OrderRow
//  Rows.Add( TOrderRow.Create(APizza) );
//end;
{$endregion}

end.
