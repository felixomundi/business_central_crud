namespace FN;

codeunit 50101 "FN FelixNinja Codeunit"
{
    procedure CreateRecord(Name: Text[100]; Skill: Text[150]; Level: Integer)
    var
        Rec: Record "FN FelixNinja";
    begin
        Rec.Init();
        Rec."Name" := Name;
        Rec."Skill" := Skill;
        Rec."Level" := Level;
        Rec.Insert();
    end;

    procedure ReadRecord(ID: Integer)
    var
        Rec: Record "FN FelixNinja";
    begin
        if Rec.Get(ID) then begin
            Message('Record Found: Name=%1, Skill=%2, Level=%3', Rec."Name", Rec."Skill", Rec."Level");
        end else
            Message('Record not found.');
    end;

    procedure UpdateRecord(ID: Integer; NewName: Text[100]; NewSkill: Text[150]; NewLevel: Integer)
    var
        Rec: Record "FN FelixNinja";
    begin
        if Rec.Get(ID) then begin
            Rec."Name" := NewName;
            Rec."Skill" := NewSkill;
            Rec."Level" := NewLevel;
            Rec.Modify();
            Message('Record updated.');
        end else
            Message('Record not found.');
    end;

    procedure DeleteRecord(ID: Integer)
    var
        Rec: Record "FN FelixNinja";
    begin
        if Rec.Get(ID) then begin
            Rec.Delete();
            Message('Record deleted.');
        end else
            Message('Record not found.');
    end;
}
