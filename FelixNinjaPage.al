namespace FN;

page 50101 "FN FelixNinja Page"
{
    PageType = List;
    SourceTable = "FN FelixNinja";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ID"; Rec."ID")
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                }
                field("Skill"; Rec."Skill")
                {
                    ApplicationArea = All;
                }
                field("Level"; Rec."Level")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Create)
            {
                ApplicationArea = All;
                Caption = 'Create New';
                Image = New;
                trigger OnAction()
                var
                    Rec: Record "FN FelixNinja";
                begin
                    Rec.Init();
                    Rec.Insert();
                    PAGE.Run(PAGE::"FN FelixNinja Page", Rec);
                end;
            }
        }
    }
}
