// Config is put into a different package to prevent cyclic imports in case
// it is needed in several locations

package config

import (
	"time"

	hb "github.com/logrhythm/sophoscentralbeat/heartbeat"
)

const (
	Filler = "FILLER"
)

type Config struct {
	Period            time.Duration `config:"period"`
	APIKey            string        `config:"api_key"`
	Authorization     string        `config:"authorization"`
	Basepath          string        `config:"api_baseurl"`
	HeartbeatInterval time.Duration `config:"heartbeatinterval"`
	HeartbeatDisabled bool          `config:"heartbeatdisabled"`
}

var DefaultConfig = Config{
	Period:            300 * time.Second,
	APIKey:            Filler,
	Authorization:     Filler,
	Basepath:          Filler,
	HeartbeatInterval: hb.IntervalValue,
	HeartbeatDisabled: false,
}
