namespace SeminarManagement.SeminarManagement;

tableextension 50104 "Seminar Reg Header Ext" extends "Seminar Registration Header"
{
    fields
    {
        field(40; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
