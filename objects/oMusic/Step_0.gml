/// @description Stopping music when their volume is 0
// You can write your code in this editor
if (audio_sound_get_gain(mBGM) <= 0)
{
	audio_stop_sound(mBGM);
}

if (audio_sound_get_gain(mDefeat) <= 0)
{
	audio_stop_sound(mDefeat);
}

if (audio_sound_get_gain(mVictory) <= 0)
{
	audio_stop_sound(mVictory);
}