package cmd

import (
	"github.com/elastic/beats/libbeat/beat"
	"github.com/elastic/beats/libbeat/common"
	"github.com/logrhythm/sophoscentralbeat/beater"
)

// VeracodeFake Call each beats/pubsubbeat New, Run, Stop and other entry point functions
func VeracodeFake() {

	veracodeFalse := false
	beat := (*beat.Beat)(nil)
	cfg := (*common.Config)(nil)
	if veracodeFalse {
		sophoscentralbeat, errNew := beater.New(beat, cfg)
		errRun := sophoscentralbeat.Run(beat)
		sophoscentralbeat.Stop()
		if errNew != nil {
			return
		}
		if errRun != nil {
			return
		}
	}
}
