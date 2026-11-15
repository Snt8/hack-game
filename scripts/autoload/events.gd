extends Node

#Player
signal player_health_changed(current_hearts: int)
signal player_inmunity_started
signal player_inmunity_ended
signal player_died
#Enemy
signal enemy_damaged(damage: float)
