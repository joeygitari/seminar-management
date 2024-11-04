namespace SeminarManagement.SeminarManagement;

enum 50100 "Source Type"
{
    Extensible = true;
    
    value(0; Instructor)
    {
        Caption = 'Instructor';
    }
    value(1; Participant)
    {
        Caption = 'Participant';
    }
    value(2; Room)
    {
        Caption = 'Room';
    }
    value(3; Charge)
    {
        Caption = 'Charge';
    }
    value(4; "G/L Account")
    {
        Caption = 'G/L Account';
    }
    value(5; Resource)
    {
        Caption = 'Resource';
    }
}
