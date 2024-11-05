namespace SeminarManagement.SeminarManagement;

enum 50102 "Seminar Charge Type"
{
    Extensible = true;
    
    value(0; Resource)
    {
        Caption = 'Resource';
    }
    value(1; "G/L Account")
    {
        Caption = 'G/L Account';
    }
}
