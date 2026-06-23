# ask_me_out

💕 Ask Me Out — Flutter Romantic Date Invitation App

A beautiful multi-step Flutter app to ask someone out on a romantic date 🌹 

✨ Overview
Ask Me Out is a charming, animated Flutter app with a deep crimson-to-blush-pink theme that guides you through creating a personalised romantic date invitation — step by step.


📱 Screenshots
Step 1 — Who 💌
Enter the name of the person you're asking out and your own name.
 <img src="assets/screenshots/screenshot_step1.png" width="250"/>


Step 2 — Where 📍
Choose from 8 preset locations (Cozy Café, Rooftop Restaurant, Beach Sunset…) or type your own dream spot.
 <img src="assets/screenshots/screenshot_step2.png" width="250"/>


Step 3 — When 📅
Pick a date using the native date picker, then select your preferred time of day from a visual grid.
<img src="assets/screenshots/screenshot_step3.png" width="250"/>



Step 4 — Vibe 🌹
Choose the mood (Romantic, Fun & Playful, Elegant, Adventurous…) and write a sweet personal message.
<img src="assets/screenshots/screenshot_step4.png" width="250"/>



Step 5 — Review ✨
See a full summary of your invite before sending it.
<img src="assets/screenshots/screenshot_step5.png" width="250"/>



🎉 Final Screen
The invite is ready — complete with a pulsing heart animation and a beautiful date banner.
<img src="assets/screenshots/screenshot_final.png" width="250"/>


🗂️ Project Structure

ask_me_out/
├── pubspec.yaml
└── lib/
    ├── main.dart                        # App entry point
    ├── theme/
    │   └── app_colors.dart              # All brand colours
    ├── models/
    │   └── date_invite.dart             # Data model & helpers
    ├── screens/
    │   └── ask_out_screen.dart          # Main stepper controller
    ├── widgets/
    │   ├── step_card.dart               # Card wrapper for each step
    │   ├── card_header.dart             # Emoji + title + subtitle
    │   ├── progress_dots.dart           # Animated progress indicator
    │   ├── nav_buttons.dart             # Back / Next / Send buttons
    │   ├── final_card.dart              # Confirmation screen
    │   ├── pulse_heart.dart             # Pulsing heart animation
    │   ├── floating_hearts_layer.dart   # Background floating hearts
    │   └── shared_widgets.dart          # RomField, RomChip, SummaryRow
    └── steps/
        ├── step1_who.dart               # Step 1: Names
        ├── step2_where.dart             # Step 2: Location
        ├── step3_when.dart              # Step 3: Date & Time
        ├── step4_vibe.dart              # Step 4: Mood & Message
        └── step5_review.dart            # Step 5: Summary

🧩 Features
✅ 5-step animated flow with smooth PageView transitions
✅ Floating hearts background — 18 animated particle hearts
✅ Pulsing heart animation on the final screen
✅ Animated progress dots that expand when active
✅ Native date picker themed in rose/pink
✅ Time-of-day grid — 6 options with emoji icons
✅ Selectable vibe chips — 6 moods to choose from
✅ 8 preset venues + custom location input
✅ Form validation with styled SnackBar errors
✅ Review summary card before sending
✅ Restart to start over
✅ Fully responsive — works on mobile, tablet, and web
