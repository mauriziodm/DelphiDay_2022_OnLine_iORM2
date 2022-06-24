unit VM.Pizzas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VM.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Interfaces;

type

  TVMPizzas = class(TVMBaseForList)
  private
    FEmbedded: Boolean;
    procedure SetEmbedded(const Value: Boolean);
  public
    property Embedded: Boolean read FEmbedded write SetEmbedded;
  end;

implementation

{$R *.dfm}

{ TVMPizzas }

procedure TVMPizzas.SetEmbedded(const Value: Boolean);
begin
  VMAction['acAdd'].Visible := not Value;
  VMAction['acBack'].Visible := not Value;
  VMAction['acDelete'].Visible := not Value;
end;

end.
