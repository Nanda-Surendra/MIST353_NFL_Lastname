from get_teams_by_conference_division import get_teams_by_conference_division

def unit_tests():
    result = get_teams_by_conference_division("AFC", "North")

    assert isinstance(result, list), "Result should be a list"
    assert len(result) == 4, "Expected 4 teams in AFC/North"
    print(f"✅ Integration test returned {len(result)} teams: {result}")

if __name__ == "__main__":
    unit_tests()