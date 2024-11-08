namespace SeminarManagement.SeminarManagement;

tableextension 50105 "Seminar Extension" extends Seminar
{
    fields
    {
        field(20; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(21; "Charge Type Filter"; Enum "Seminar Journal Charge Type")
        {
            Caption = 'Charge Type Filter';
            FieldClass = FlowFilter;
        }
        field(25; "Total Price"; Decimal)
        {
            Caption = 'Total Price';
            FieldClass = FlowField;
            Editable = false;
            AutoFormatType = 1;
            CalcFormula = Sum("Seminar Ledger Entry"."Total Price" 
                            where ("Seminar No." = FIELD("No."), 
                            "Posting Date" = FIELD("Date Filter"), 
                            "Charge Type" = FIELD("Charge Type Filter")));
        }
        field(26; "Total Price (Not Chargeable)"; Decimal)
        {
            Caption = 'Total Price (Not Chargeable)';
            FieldClass = FlowField;
            Editable = false;
            AutoFormatType = 1;
            CalcFormula = Sum("Seminar Ledger Entry"."Total Price" 
                            where ("Seminar No." = FIELD("No."), 
                            "Posting Date" = FIELD("Date Filter"), 
                            "Charge Type" = FIELD("Charge Type Filter"),
                            Chargeable = CONST(true)));
        }
        field(27; "Total Price (Chargeable)"; Decimal)
        {
            Caption = 'Total Price (Chargeable)';
            FieldClass = FlowField;
            Editable = false;
            AutoFormatType = 1;
            CalcFormula = Sum("Seminar Ledger Entry"."Total Price" 
                            where ("Seminar No." = FIELD("No."), 
                            "Posting Date" = FIELD("Date Filter"), 
                            "Charge Type" = FIELD("Charge Type Filter"),
                            Chargeable = CONST(true)));
        }
    }
}
