unit Elvinor.Locations;

interface

type
  TLocation = class(TObject)
  private
    FCurrentLocationIndex: Integer;
  public type
    TLink = record
      Index: Integer;
      Title: string;
    end;
  public type
    TBaseLocation = record
      Description: string;
      Link: array [1 .. 4] of TLink;
    end;
  public
    constructor Create;
    destructor Destroy; override;
    property CurrentLocationIndex: Integer read FCurrentLocationIndex;
    procedure GoToLocation(const LocationIndex: Integer);
    function CurrentLocation: TBaseLocation;
  end;

implementation

uses System.SysUtils;

const
  BaseLocation: array [0 .. 2] of TLocation.TBaseLocation = (
    // #0
    (Description: 'Описание локации #0';
    Link: ((Index: 1; Title: 'Осмотреться #0'), (), (), (Index: 2;
    Title: 'Осмотреться #2'))),
    // #1
    (Description: 'Описание локации #1';
    Link: ((Index: 2; Title: 'Осмотреться #1'), (), (), ())),
    // #2
    (Description: 'Описание локации #2';
    Link: ((Index: 0; Title: 'Осмотреться #2'), (), (), ()))
    //
    );

  { TLocation }

constructor TLocation.Create;
begin
  FCurrentLocationIndex := 0;
end;

destructor TLocation.Destroy;
begin

  inherited;
end;

function TLocation.CurrentLocation: TBaseLocation;
begin
  Result := BaseLocation[FCurrentLocationIndex];
end;

procedure TLocation.GoToLocation(const LocationIndex: Integer);
begin
  FCurrentLocationIndex := LocationIndex;
end;

end.
