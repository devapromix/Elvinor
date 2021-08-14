unit Elvinor.Player;

interface

type
  TPlayer = class(TObject)
  private
    FLevel: Byte;
    FName: string;
    FMaxDamage: Word;
    FMinDamage: Word;
    FExp: Cardinal;
    FHP: Word;
    FMaxHP: Word;
    FDefense: Word;
  public
    constructor Create;
    destructor Destroy; override;
    property Name: string read FName write FName;
    property Level: Byte read FLevel write FLevel;
    property Exp: Cardinal read FExp write FExp;
    function MaxExp: Cardinal;
    property MinDamage: Word read FMinDamage write FMinDamage;
    property MaxDamage: Word read FMaxDamage write FMaxDamage;
    property Defense: Word read FDefense write FDefense;
    property HP: Word read FHP write FHP;
    property MaxHP: Word read FMaxHP write FMaxHP;
    function ToString: string;
    procedure AddExp(N: Word);
  end;

implementation

uses System.SysUtils;

{ TPlayer }

procedure TPlayer.AddExp(N: Word);
begin

end;

constructor TPlayer.Create;
begin
  Name := 'ИГРОК';
  Exp := 0;
  Level := 1;
  MaxHP := 60;
  HP := MaxHP;
  MinDamage := 3;
  MaxDamage := 5;
  Defense := 2;
end;

destructor TPlayer.Destroy;
begin

  inherited;
end;

function TPlayer.MaxExp: Cardinal;
begin
  Result := Level * 45;
end;

function TPlayer.ToString: string;
begin
  Result := '';
  Result := Result + Name + ':' + #13#10;
  Result := Result + Format('Уровень %d', [Level]) + #13#10;
  Result := Result + Format('Опыт %d/%d', [Exp, MaxExp]) + #13#10;
  Result := Result + Format('HP %d/%d', [HP, MaxHP]) + #13#10;
  Result := Result + Format('Урон %d-%d', [MinDamage, MaxDamage]) + #13#10;
  Result := Result + Format('Защита %d', [Defense]) + #13#10;
  // S := S + Format('', []) + #13#10;
end;

end.
