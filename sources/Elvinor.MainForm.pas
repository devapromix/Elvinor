unit Elvinor.MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Elvinor.Locations, Elvinor.Player;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    EqHead: TPanel;
    EqBody: TPanel;
    EqWeapon: TPanel;
    EqBoots: TPanel;
    Panel13: TPanel;
    Panel15: TPanel;
    InvItem1: TPanel;
    InvItem2: TPanel;
    InvItem3: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
  private
    FLocation: TLocation;
    FPlayer: TPlayer;
    { Private declarations }
  public
    { Public declarations }
    property Player: TPlayer read FPlayer;
    property Location: TLocation read FLocation write FLocation;
    procedure GoToLocation(const LocationIndex: Integer);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FLocation := TLocation.Create;
  FPlayer := TPlayer.Create;
  GoToLocation(0);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FPlayer);
  FreeAndNil(FLocation);
end;

procedure TMainForm.GoToLocation(const LocationIndex: Integer);
var
  S: string;
begin
  Location.GoToLocation(LocationIndex);
  Label1.Caption := FLocation.CurrentLocation.Description;
  Label2.Caption := Player.ToString;
  // Label3.Caption := Inventory.ToString;
  if FLocation.CurrentLocation.Link[1].Title <> '' then
    S := Format(' 1. %s', [FLocation.CurrentLocation.Link[1].Title])
  else
    S := '';
  Panel8.Caption := S;
  Panel8.Visible := S <> '';
  if FLocation.CurrentLocation.Link[2].Title <> '' then
    S := Format(' 2. %s', [FLocation.CurrentLocation.Link[2].Title])
  else
    S := '';
  Panel7.Caption := S;
  Panel7.Visible := S <> '';
  if FLocation.CurrentLocation.Link[3].Title <> '' then
    S := Format(' 3. %s', [FLocation.CurrentLocation.Link[3].Title])
  else
    S := '';
  Panel6.Caption := S;
  Panel6.Visible := S <> '';
  if FLocation.CurrentLocation.Link[4].Title <> '' then
    S := Format(' 4. %s', [FLocation.CurrentLocation.Link[4].Title])
  else
    S := '';
  Panel5.Caption := S;
  Panel5.Visible := S <> '';
end;

procedure TMainForm.Panel5Click(Sender: TObject);
begin
  if Location.CurrentLocation.Link[(Sender as TPanel).Tag].Title <> '' then
    GoToLocation(Location.CurrentLocation.Link[(Sender as TPanel).Tag].Index);
end;

end.
