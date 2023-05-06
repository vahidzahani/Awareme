VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Aware me 1.0"
   ClientHeight    =   1980
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5430
   FillColor       =   &H80000012&
   Icon            =   "form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1980
   ScaleWidth      =   5430
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command4 
      Caption         =   "Hide"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3000
      TabIndex        =   7
      Top             =   120
      Width           =   1335
   End
   Begin VB.CheckBox Check2 
      Caption         =   "PC Beep"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   2640
      TabIndex        =   6
      Top             =   960
      Width           =   1215
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Sound Cart"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   1440
      TabIndex        =   5
      Top             =   960
      Value           =   1  'Checked
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Test_sound"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   960
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Start"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1560
      TabIndex        =   3
      Top             =   120
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   120
      TabIndex        =   2
      Text            =   "DOORBELL.WAV"
      Top             =   600
      Width           =   5175
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   3360
      ScaleHeight     =   705
      ScaleWidth      =   1425
      TabIndex        =   1
      Top             =   1200
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   2640
      Top             =   1320
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Select Poistion"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1335
   End
   Begin VB.Shape Shape1 
      BorderStyle     =   6  'Inside Solid
      BorderWidth     =   3
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Left            =   4440
      Shape           =   3  'Circle
      Top             =   120
      Width           =   375
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Me.Visible = False
DoEvents
'Sleep 1000
Form2.Show vbModal
Me.Visible = True
End Sub
Private Sub RunSound()
    Me.Show
    If Check1.Value = 1 Then
     lSound = sndSound(Text1.Text, 1)
    End If
    If Check2.Value = 1 Then
    Beep 1000, 100
    Beep 500, 100
    Beep 1000, 100
    End If



End Sub


Private Sub Command2_Click()
Timer1.Enabled = True
End Sub

Private Sub Command3_Click()
lSound = sndSound(Text1.Text, 1)
End Sub

Private Sub Command4_Click()
If Timer1.Enabled = True Then Me.Hide
End Sub

Private Sub Form_Load()
Me.Left = Screen.Width - Me.Width
Me.Top = Screen.Height - Me.Height - 500
Picture1.Height = Screen.Height
Picture1.Width = Screen.Width

End Sub

Private Sub Timer1_Timer()
If Shape1.FillColor = vbRed Then
Shape1.FillColor = vbGreen
Else
Shape1.FillColor = vbRed
End If

Picture1.Picture = CaptureScreen
Picture1.Refresh

If Picture1.Point(MYX, MYY) <> MyColor Then
Call RunSound
    Timer1.Enabled = False
    Shape1.FillColor = vbRed
End If
End Sub
