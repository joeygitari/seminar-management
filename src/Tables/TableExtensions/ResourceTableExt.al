tableextension 50100 "Resource Extension" extends Resource
{
    fields
    {
        field(50000; "Internal/External"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Internal/External';
            OptionMembers = Internal,External;
            OptionCaption = 'Internal,External';
        }
        field(50001; "Maximum Participants"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Maximum Participants';
        }
        field(50002; "Quantity Per Day"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantity Per Day';
        }
        // field(50003; "Internal/External"; Text[50])
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'Internal/External';
        // }
    }
}
