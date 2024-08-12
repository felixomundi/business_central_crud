namespace FN;

table 50101 "FN FelixNinja"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "ID"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }

        field(2; "Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Skill"; Text[150])
        {
            DataClassification = ToBeClassified;
        }

        field(4; "Level"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "ID")
        {
            Clustered = true;
        }
    }
}